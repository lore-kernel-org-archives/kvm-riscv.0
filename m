From: kirill.shutemov@linux.intel.com <kirill.shutemov@linux.intel.com>
Date: Sat, 2 Sep 2023 00:05:55 +0300
Subject: [PATCH gmem FIXUP] mm, compaction: make testing
 mapping_unmovable() safe
In-Reply-To: <20230901082025.20548-2-vbabka@suse.cz>
References: <20230901082025.20548-2-vbabka@suse.cz>
Message-ID: <20230901210555.j5d5a4azmkxzlnn2@box.shutemov.name>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 01, 2023 at 10:20:26AM +0200, Vlastimil Babka wrote:
> As Kirill pointed out, mapping can be removed under us due to
> truncation. Test it under folio lock as already done for the async
> compaction / dirty folio case. To prevent locking every folio with
> mapping to do the test, do it only for unevictable folios, as we can
> expect the unmovable mapping folios are also unevictable - it is the
> case for guest memfd folios.
> 
> Also incorporate comment update suggested by Matthew.
> 
> Fixes: 3424873596ce ("mm: Add AS_UNMOVABLE to mark mapping as completely unmovable")
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Superficially looks good to me. But I don't really understand this
code path to Ack.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

