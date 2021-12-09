From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 09 Dec 2021 22:38:29 +0000
Subject: [PATCH v5 08/12] KVM: Reinstate gfn_to_pfn_cache with
 invalidation support
In-Reply-To: <6cb2cd57-16f3-d0ec-adf6-cb8fdcbae035@redhat.com>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-9-dwmw2@infradead.org>
 <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
 <b614d9ae0fe7910cfa72eee0b4077776f8012e5f.camel@infradead.org>
 <6cb2cd57-16f3-d0ec-adf6-cb8fdcbae035@redhat.com>
Message-ID: <0a4632fc06af0947c272a9e843e994b2be1bb888.camel@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-12-09 at 23:34 +0100, Paolo Bonzini wrote:
> Compared to the review it's missing this hunk:
> 
> @@ -265,7 +265,7 @@ void kvm_gfn_to_pfn_cache_unmap(struct kvm *kvm, struct gfn_to_pfn_cache *gpc)
> 
>         gpc->valid = false;
> 
> -       old_khva = gpc->khva;
> +       old_khva = (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
>         old_dirty = gpc->dirty;
>         old_gpa = gpc->gpa;
>         old_pfn = gpc->pfn;

Ah right, there were two of those. Will fix; thanks.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5174 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211209/eca29656/attachment-0001.p7s>
