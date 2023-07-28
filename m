From: Vlastimil Babka <vbabka@suse.cz>
Date: Fri, 28 Jul 2023 18:02:46 +0200
Subject: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
In-Reply-To: <ZL/Fa4W2Ne9EVxoh@casper.infradead.org>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-11-seanjc@google.com>
 <20230725102403.xywjqlhyqkrzjok6@box.shutemov.name>
 <ZL/Fa4W2Ne9EVxoh@casper.infradead.org>
Message-ID: <692b09f7-70d9-1119-7fe2-3e7396ec259d@suse.cz>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/25/23 14:51, Matthew Wilcox wrote:
> On Tue, Jul 25, 2023 at 01:24:03PM +0300, Kirill A . Shutemov wrote:
>> On Tue, Jul 18, 2023 at 04:44:53PM -0700, Sean Christopherson wrote:
>> > diff --git a/mm/compaction.c b/mm/compaction.c
>> > index dbc9f86b1934..a3d2b132df52 100644
>> > --- a/mm/compaction.c
>> > +++ b/mm/compaction.c
>> > @@ -1047,6 +1047,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>> >  		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
>> >  			goto isolate_fail_put;
>> >  
>> > +		/* The mapping truly isn't movable. */
>> > +		if (mapping && mapping_unmovable(mapping))
>> > +			goto isolate_fail_put;
>> > +
>> 
>> I doubt that it is safe to dereference mapping here. I believe the folio
>> can be truncated from under us and the mapping freed with the inode.
>> 
>> The folio has to be locked to dereference mapping safely (given that the
>> mapping is still tied to the folio).
> 
> There's even a comment to that effect later on in the function:

Hmm, well spotted. But it wouldn't be so great if we now had to lock every
inspected page (and not just dirty pages), just to check the AS_ bit.

But I wonder if this is leftover from previous versions. Are the guest pages
even PageLRU currently? (and should they be, given how they can't be swapped
out or anything?) If not, isolate_migratepages_block will skip them anyway.

> 
>                         /*
>                          * Only pages without mappings or that have a
>                          * ->migrate_folio callback are possible to migrate
>                          * without blocking. However, we can be racing with
>                          * truncation so it's necessary to lock the page
>                          * to stabilise the mapping as truncation holds
>                          * the page lock until after the page is removed
>                          * from the page cache.
>                          */
> 
> (that could be reworded to make it clear how dangerous dereferencing
> ->mapping is without the lock ... and it does need to be changed to say
> "folio lock" instead of "page lock", so ...)

> How does this look?
> 
>                         /*
>                          * Only folios without mappings or that have
>                          * a ->migrate_folio callback are possible to
>                          * migrate without blocking. However, we can
>                          * be racing with truncation, which can free
>                          * the mapping.  Truncation holds the folio lock
>                          * until after the folio is removed from the page
>                          * cache so holding it ourselves is sufficient.
>                          */
> 


