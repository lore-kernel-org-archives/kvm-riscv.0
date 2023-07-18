From: Sean Christopherson <seanjc@google.com>
Date: Tue, 18 Jul 2023 16:44:53 -0700
Subject: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
Message-ID: <20230718234512.1690985-11-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/pagemap.h | 11 +++++++++++
 mm/compaction.c         |  4 ++++
 mm/migrate.c            |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 716953ee1ebd..931d2f1da7d5 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -203,6 +203,7 @@ enum mapping_flags {
 	/* writeback related tags are not used */
 	AS_NO_WRITEBACK_TAGS = 5,
 	AS_LARGE_FOLIO_SUPPORT = 6,
+	AS_UNMOVABLE	= 7,	/* The mapping cannot be moved, ever */
 };
 
 /**
@@ -273,6 +274,16 @@ static inline int mapping_use_writeback_tags(struct address_space *mapping)
 	return !test_bit(AS_NO_WRITEBACK_TAGS, &mapping->flags);
 }
 
+static inline void mapping_set_unmovable(struct address_space *mapping)
+{
+	set_bit(AS_UNMOVABLE, &mapping->flags);
+}
+
+static inline bool mapping_unmovable(struct address_space *mapping)
+{
+	return test_bit(AS_UNMOVABLE, &mapping->flags);
+}
+
 static inline gfp_t mapping_gfp_mask(struct address_space * mapping)
 {
 	return mapping->gfp_mask;
diff --git a/mm/compaction.c b/mm/compaction.c
index dbc9f86b1934..a3d2b132df52 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1047,6 +1047,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
 			goto isolate_fail_put;
 
+		/* The mapping truly isn't movable. */
+		if (mapping && mapping_unmovable(mapping))
+			goto isolate_fail_put;
+
 		/*
 		 * Only allow to migrate anonymous pages in GFP_NOFS context
 		 * because those do not depend on fs locks.
diff --git a/mm/migrate.c b/mm/migrate.c
index 24baad2571e3..c00a4ca86698 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -954,6 +954,8 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 
 		if (!mapping)
 			rc = migrate_folio(mapping, dst, src, mode);
+		else if (mapping_unmovable(mapping))
+			rc = -EOPNOTSUPP;
 		else if (mapping->a_ops->migrate_folio)
 			/*
 			 * Most folios have a mapping and most filesystems
-- 
2.41.0.255.g8b1d071c50-goog


