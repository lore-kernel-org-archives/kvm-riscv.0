From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:28 -0800
Subject: [RFC PATCH 08/37] KVM: selftests: Stop assuming stats are contiguous
 in kvm_binary_stats_test
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-9-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jing Zhang <jingzhangos@google.com>

Remove the assumption from kvm_binary_stats_test that all stats are
laid out contiguously in memory. The KVM stats ABI specifically allows
holes in the stats data, since each stat exposes its own offset.

While here drop the check that each stats' offset is less than
size_data, as that is now always true by construction.

Fixes: 0b45d58738cd ("KVM: selftests: Add selftest for KVM statistics data binary interface")
Signed-off-by: Jing Zhang <jingzhangos@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
[Re-worded the commit message.]

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/kvm_binary_stats_test.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/kvm_binary_stats_test.c b/tools/testing/selftests/kvm/kvm_binary_stats_test.c
index 894417c96f70..46a66ece29fd 100644
--- a/tools/testing/selftests/kvm/kvm_binary_stats_test.c
+++ b/tools/testing/selftests/kvm/kvm_binary_stats_test.c
@@ -134,7 +134,8 @@ static void stats_test(int stats_fd)
 				    "Bucket size of stats (%s) is not zero",
 				    pdesc->name);
 		}
-		size_data += pdesc->size * sizeof(*stats_data);
+		size_data = max(size_data,
+			pdesc->offset + pdesc->size * sizeof(*stats_data));
 	}
 
 	/*
@@ -149,14 +150,6 @@ static void stats_test(int stats_fd)
 	TEST_ASSERT(size_data >= header.num_desc * sizeof(*stats_data),
 		    "Data size is not correct");
 
-	/* Check stats offset */
-	for (i = 0; i < header.num_desc; ++i) {
-		pdesc = get_stats_descriptor(stats_desc, i, &header);
-		TEST_ASSERT(pdesc->offset < size_data,
-			    "Invalid offset (%u) for stats: %s",
-			    pdesc->offset, pdesc->name);
-	}
-
 	/* Allocate memory for stats data */
 	stats_data = malloc(size_data);
 	TEST_ASSERT(stats_data, "Allocate memory for stats data");
-- 
2.39.0.rc1.256.g54fd8350bd-goog


