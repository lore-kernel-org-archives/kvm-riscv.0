From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 1 Nov 2023 23:28:32 +0100
Subject: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
In-Reply-To: <ZUJ-cJfofk2d_I0B@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
 <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
 <ZUJVfCkIYYFp5VwG@google.com>
 <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com>
Message-ID: <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/1/23 17:36, Sean Christopherson wrote:
>>> "Allow" isn't perfect, e.g. I would much prefer a straight KVM_GUEST_MEMFD_USE_HUGEPAGES
>>> or KVM_GUEST_MEMFD_HUGEPAGES flag, but I wanted the name to convey that KVM doesn't
>>> (yet) guarantee hugepages.  I.e. KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is stronger than
>>> a hint, but weaker than a requirement.  And if/when KVM supports a dedicated memory
>>> pool of some kind, then we can add KVM_GUEST_MEMFD_REQUIRE_HUGEPAGE.
>> I think that the current patch is fine, but I will adjust it to always
>> allow the flag, and to make the size check even if !CONFIG_TRANSPARENT_HUGEPAGE.
>> If hugepages are not guaranteed, and (theoretically) you could have no
>> hugepage at all in the result, it's okay to get this result even if THP is not
>> available in the kernel.
> Can you post a fixup patch?  It's not clear to me exactly what behavior you intend
> to end up with.

Sure, just this:

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 7d1a33c2ad42..34fd070e03d9 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -430,10 +430,7 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
  {
  	loff_t size = args->size;
  	u64 flags = args->flags;
-	u64 valid_flags = 0;
-
-	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
-		valid_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
+	u64 valid_flags = KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
  
  	if (flags & ~valid_flags)
  		return -EINVAL;
@@ -441,11 +438,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
  	if (size < 0 || !PAGE_ALIGNED(size))
  		return -EINVAL;
  
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  	if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
  	    !IS_ALIGNED(size, HPAGE_PMD_SIZE))
  		return -EINVAL;
-#endif
  
  	return __kvm_gmem_create(kvm, size, flags);
  }

Paolo


