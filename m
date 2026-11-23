Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFB3606A31E
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R1rdYHkL;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EJMipN2q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3f+zw0lXYZmjmsPB9+eMSMGNi0vc4dnZPfef8crGHdY=; b=R1rdYHkLzujkzMTQeluhsscBzg
	3yY/yz31aKPySxGDbFU7fZKIgZifoV1/O5zgfO+fP1VjXwuIvuza+YVCj6QWh7rhP5TRE+en7cUM0
	kViLtU2gQJgkx4ZdWGt7fUsBSpo3pmMR7OjvDbSIxszO54olyOrkgMPVRNLWg/xlW7bTADTMPpNNA
	IX96NXfVSsLmLH7zCFvc7APlX8CuEhhJoLh8dBH7P+gZKnCfr0QC8xADQs0WGKGkvKIZivKO75tzL
	7HeVOyynIv0KoOKDoABxRKdacssu7xe4QvJxvf6Jpv+8xslzz0ZzYc1GyznP9LWz+QP6cPZTFEm43
	QZcmoTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSJv-00000003Bvq-1Pj4;
	Mon, 23 Nov 2026 11:34:51 +0000
Received: from out-118.mta1.migadu.com ([2001:41d0:203:375::76] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSJn-00000003Bry-2vHm
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 11:34:48 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GFdOLbAuUR9hfwY/LXg7YohW2tjrVa6l2cMuco/EPYU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795433681; v=1; x=1796038481;
 b=EJMipN2qWlyGuNiXFej4NzeZIFFlv//5wKRgeR75WdOZ8XYgAGUZb1I4M+3TukEc/GAAojt2
 KV0ItrVp7sDbIoRuljsxgyun/twxcfpPvGanlG0q9/UmUOa/8gCtCzFYWPXwyymIybXSSt0ilyl
 kZFz4VWJEgsATXViJ9pTm4Bc=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1ec6cd2606eb83c4;
	Mon, 23 Nov 2026 11:34:41 +0000
X-Mizu-Trace-ID: 1ec6cd2606eb83c4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	kvm-riscv@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's dirty ring is full
Date: Mon, 23 Nov 2026 11:34:33 +0000
Message-ID: <20261123113435.1170711-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123113435.1170711-1-fuad.tabba@linux.dev>
References: <20261123113435.1170711-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_033444_450308_DAF4EE5C 
X-CRM114-Status: GOOD (  16.59  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pre-faulting can map a dirty-logged page writable, which pushes it to
the vCPU's dirty ring. KVM_RUN exits with KVM_EXIT_DIRTY_RING_FULL
before the ring overflows, but the pre-fault loop never checks it, so
one call can push more entries than the ring has free, which trips the
WARN in kvm_dirty_ring_push() and overwrites entries userspace hasn't
harvested. On x86:

  WARNING: arch/x86/kvm/../../../virt/kvm/dirty_ring.c:225 at kvm_dirty_ring_push+0x7a/0xd0
  Call Trace:
   make_spte+0x2cc/0x450
   kvm_tdp_mmu_map+0x5e1/0x7f0
   kvm_tdp_page_fault+0x12c/0x1b0
   kvm_mmu_do_page_fault+0x181/0x250
   kvm_arch_vcpu_pre_fault_memory+0x136/0x1d0
   kvm_vcpu_pre_fault_memory+0xcf/0x180
   kvm_vcpu_ioctl+0x455/0x770

Stop the loop once the ring is soft full, with the check KVM_RUN makes
before entering the guest. Return the pages already processed, or
-ENOSPC when there aren't any, since a retry can't succeed until
userspace harvests and resets the ring. s390 has the ioctl but no ring,
so give kvm_dirty_ring_check_request() a stub.

The check also sets run->exit_reason to KVM_EXIT_DIRTY_RING_FULL. On
arm64, KVM_RUN completes a pending MMIO exit only if exit_reason is
still KVM_EXIT_MMIO, and on riscv KVM_RUN does the same for its MMIO,
SBI and CSR exits. If a pre-fault stops on a full ring while such an
exit is pending, the next KVM_RUN doesn't complete it and the guest
repeats the instruction that caused the exit. Userspace can avoid that
by completing the exit with KVM_RUN before pre-faulting.

Fixes: bc1a5cd002116 ("KVM: Add KVM_PRE_FAULT_MEMORY vcpu ioctl to pre-populate guest memory")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/api.rst | 9 +++++++--
 include/linux/kvm_dirty_ring.h | 5 +++++
 virt/kvm/kvm_main.c            | 5 +++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e95c9cda085d9..89eb6be9bc6e3 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6544,6 +6544,7 @@ Errors:
   ENOENT     The specified `gpa` is outside defined memslots.
   ENOEXEC    The vCPU has not been initialised (arm64).
   EINTR      An unmasked signal is pending and no page was processed.
+  ENOSPC     The vCPU's dirty ring is full and no page was processed.
   EFAULT     The parameter address was invalid.
   EHWPOISON  A poisoned host page was encountered.
   EOPNOTSUPP Mapping memory for a GPA is unsupported by the
@@ -6588,7 +6589,9 @@ case, the ioctl can be called in parallel.
 
 When the ioctl returns, the input values are updated to point to the
 remaining range.  If `size` > 0 on return, the caller can just issue
-the ioctl again with the same `struct kvm_map_memory` argument.
+the ioctl again with the same `struct kvm_pre_fault_memory` argument.
+If that fails with ENOSPC, the vCPU's dirty ring has to be harvested
+and reset first.
 
 On x86, shadow page tables cannot support this ioctl because they
 are indexed by virtual address or nested guest physical address.
@@ -8957,7 +8960,9 @@ Therefore, the ioctl must be called *before* reading the content of
 the dirty pages.
 
 The dirty ring can get full.  When it happens, the KVM_RUN of the
-vcpu will return with exit reason KVM_EXIT_DIRTY_RING_FULL.
+vcpu will return with exit reason KVM_EXIT_DIRTY_RING_FULL, and
+KVM_PRE_FAULT_MEMORY on the vcpu will process no more pages until the
+ring has been harvested and reset.
 
 The dirty ring interface has a major difference comparing to the
 KVM_GET_DIRTY_LOG interface in that, when reading the dirty ring from
diff --git a/include/linux/kvm_dirty_ring.h b/include/linux/kvm_dirty_ring.h
index eb10d87adf7d5..729615ae0cf4d 100644
--- a/include/linux/kvm_dirty_ring.h
+++ b/include/linux/kvm_dirty_ring.h
@@ -60,6 +60,11 @@ static inline void kvm_dirty_ring_push(struct kvm_vcpu *vcpu,
 {
 }
 
+static inline bool kvm_dirty_ring_check_request(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+
 static inline struct page *kvm_dirty_ring_get_page(struct kvm_dirty_ring *ring,
 						   u32 offset)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf4cb586f1407..ac8b94a386e4a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4461,6 +4461,11 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 			break;
 		}
 
+		if (kvm_dirty_ring_check_request(vcpu)) {
+			r = -ENOSPC;
+			break;
+		}
+
 		r = kvm_arch_vcpu_pre_fault_memory(vcpu, range);
 		if (WARN_ON_ONCE(r == 0 || r == -EIO))
 			break;
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
