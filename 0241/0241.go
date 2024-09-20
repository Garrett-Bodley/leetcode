package main

import (
	"fmt"
	"regexp"
	"strconv"
	"strings"
)

func main() {
	exp := "2*3-4*5"
	res := diffWaysToCompute(exp)
	fmt.Printf("answer: %v\n", res)
}

func diffWaysToCompute(exp string) []int {
	tokens := tokenize(exp)
	memo := make(map[string][]int)
	res := traverse(tokens, &memo)
	return res
}

func traverse(exp []string, memo *map[string][]int) []int {
	res := make([]int, 0)
	expKey := strings.Join(exp, "")
	if (*memo)[expKey] != nil {
		return (*memo)[expKey]
	}

	if len(exp) == 1 {
		valInt, err := strconv.Atoi(exp[0])
		if err != nil {
			panic(err)
		}
		res = append(res, valInt)
		(*memo)[exp[0]] = res
		return res
	}

	for i := 1; i < len(exp); i += 2 {

		vals1Key := strings.Join(exp[0:i], "")
		var vals1 []int
		if (*memo)[vals1Key] != nil {
			vals1 = (*memo)[vals1Key]
		}else{
			vals1 = traverse(exp[0:i], memo)
			(*memo)[vals1Key] = vals1
		}

		vals2Key := strings.Join(exp[i + 1:], "")
		var vals2 []int
			if (*memo)[vals2Key] != nil {
			vals2 = (*memo)[vals2Key]
		}else{
			vals2 = traverse(exp[i + 1:], memo)
			(*memo)[vals2Key] = vals2
		}

		sign := exp[i]
		for _, v1 := range vals1 {
			for _, v2 := range vals2 {
				switch sign {
				case "+":
					res = append(res, v1+v2)
				case "-":
					res = append(res, v1-v2)
				case "*":
					res = append(res, v1*v2)
				}
			}
		}
	}
	(*memo)[expKey] = res

	return res
}

func tokenize(exp string) []string {
	res := make([]string, 0)
	re := regexp.MustCompile(`([\-\+\*])`)
	matches := re.FindAllStringIndex(exp, -1)
	last := 0

	for _, indices := range matches {
		if last != indices[0] {
			res = append(res, exp[last:indices[0]])
		}
		res = append(res, exp[indices[0]:indices[1]])
		last = indices[1]
	}

	if last < len(exp) {
		res = append(res, exp[last:])
	}
	return res
}
