class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        def count_map(s: str) -> dict:
            dict_map = {}
            for l in s:
                if l in dict_map.keys():
                    dict_map[l] += 1
                else:
                    dict_map[l] = 1
            return dict_map

        return count_map(s) == count_map(t)

        