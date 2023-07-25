From: Kirill A . Shutemov <kirill.shutemov@linux.intel.com>
Date: Tue, 25 Jul 2023 13:24:03 +0300
Subject: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
In-Reply-To: <20230718234512.1690985-11-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-11-seanjc@google.com>
Message-ID: <20230725102403.xywjqlhyqkrzjok6@box.shutemov.name>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 18, 2023 at 04:44:53PM -0700, Sean Christopherson wrote:
> diff --git a/mm/compaction.c b/mm/compaction.c
> index dbc9f86b1934..a3d2b132df52 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -1047,6 +1047,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>  		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
>  			goto isolate_fail_put;
>  
> +		/* The mapping truly isn't movable. */
> +		if (mapping && mapping_unmovable(mapping))
> +			goto isolate_fail_put;
> +

I doubt that it is safe to dereference mapping here. I believe the folio
can be truncated from under us and the mapping freed with the inode.

The folio has to be locked to dereference mapping safely (given that the
mapping is still tied to the folio).

Vlastimil, any comments?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

