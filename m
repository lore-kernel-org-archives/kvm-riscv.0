From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 9 Dec 2021 23:34:37 +0100
Subject: [PATCH v5 08/12] KVM: Reinstate gfn_to_pfn_cache with
 invalidation support
In-Reply-To: <b614d9ae0fe7910cfa72eee0b4077776f8012e5f.camel@infradead.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-9-dwmw2@infradead.org>
 <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
 <b614d9ae0fe7910cfa72eee0b4077776f8012e5f.camel@infradead.org>
Message-ID: <6cb2cd57-16f3-d0ec-adf6-cb8fdcbae035@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/9/21 21:40, David Woodhouse wrote:
> 
> NP, very useful fixes. Thanks. Incremental patch looks like this. It
> passes the xen_shinfo_test self-test; will test it with real Xen guests
> tomorrow and repost based on your kvm/next tree once it shows up.

Compared to the review it's missing this hunk:


@@ -265,7 +265,7 @@ void kvm_gfn_to_pfn_cache_unmap(struct kvm *kvm, struct gfn_to_pfn_cache *gpc)
   
   	gpc->valid = false;
   
-	old_khva = gpc->khva;
+	old_khva = (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
   	old_dirty = gpc->dirty;
   	old_gpa = gpc->gpa;
   	old_pfn = gpc->pfn;

Otherwise looks good, thanks!

Paolo

