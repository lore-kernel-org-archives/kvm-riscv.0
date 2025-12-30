Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A236EE01F6
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Fkdf5NLU8/FW2WxfBxH4Z4kU2z3iyb7IYQZ4bjmn1Q=; b=wv7tbsElX2pPWe
	Sbk6XSR1L4GDr21ECPD8dRnStyuDhMy5xfBkXJDQODa4ciNG84dR36fhmgF3oMEDXpT5L/OY0/A9w
	ECIEGlfdikfcVJgXi3jPOCn7a5iIdY/Q0kwKvo0pOehBnV2f5XXmNdJ/QMkOBC3IyjQFCg8H8Eq7G
	KoH6NoKSmvyhnEQtalIW8AORu+AA1U4CXeO50L2I7B8e8e7/uGWeLZJ9PwQjFtYStdbAMedF8Eki0
	eVdhv7RumxtBjSWPrmembjWG+ckpUVXNJNWG0FsYqbm0K2EZoFHTfvUZdXCXZAETjZAjH8o/0i2Ay
	qsCslFTuU+hMQNWBhHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijO-00000005MyI-24uy;
	Tue, 30 Dec 2025 23:02:22 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaiiw-00000005Mek-3axx
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:10 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7dd05696910so15559528b3a.2
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135713; x=1767740513; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DduiMfmTpcy5dWbJfJJBZV4wRgqp4T0woAtqbJ6bKWQ=;
        b=SpTDVzH5NHaMWwc4acDPlpijEnOy95gZp/YZacjeRGKdqMozNnn4/aJ5Ia06rPScvZ
         0QoZNEK7N4dlYZdV3jwhRCPCwNO2zIS0ktfEmOpGwkL02GhhruYBB33aP9e+LnfjHOt7
         wSsVgxjDhYPucvc1wmFbSgPnLtiqHWTMkD1Na1/ybCrmjgbldayBf2IRBNbdp0nlm2q/
         lu2oSE6pjXHd7cGyavmOWxy7N/Ws1yiP/5k18TpHdbQWs55AkXE4mMoPQ9xEtqWUJMq6
         AizNnDgNa4GWLMKww5ItchvMZGgDhg2RAroR1WFeBaezffgGtCZYaltp1SSMLWpSUwKZ
         nljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135713; x=1767740513;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DduiMfmTpcy5dWbJfJJBZV4wRgqp4T0woAtqbJ6bKWQ=;
        b=VZag/Y95ulmJw6y9xqEspiOlFx2qXo0hcF22X2YGId+meTnNlPhbzrVP/MQ+G17cBy
         jG/M0T1JElDtlBVQCmpz9WeFBBT7Ma/dNoYMjOjjn1/5LHdpraofWg1B2HHhy7U+H8a8
         ZgJTk9M2sKLbrAhBoAS+/iBpxbWCcf0HdJ0NxIOTus6clwAkFc3g/03yzN5PyGHtkRLf
         +0kXeLsj5tMOWoJB9WA7Wb+RilEAnpEbH53xu7xMI/4qnNTzFbXSy9+sYNsEnyk63VeB
         ZDDurLRoxr0W2MI57ysgYbh4OSoEdIcQE6v0shQMQMzbkMMUMFwcl2tFRYW92UAMxP5h
         XuDA==
X-Forwarded-Encrypted: i=1; AJvYcCWY4XlkV650Cam+uw229waNmwC6eSksQDAI5dgoA4E/A2x00yp2RcoH6YRXREExIVU6BMe7KtFpLk4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxoxQW3+6lT87FVU6YllmVnRnFhI3nFgmhZfK+O7ITSMbXDWvat
	h6OsM7CFT1JqzwlrtF4kqgbGNyVK9V+mKXgLAnq9cLsK73uZSqhfgQY2zlSWIqX7xpypeMBYWx7
	7NTzzUA==
X-Google-Smtp-Source: AGHT+IFl5YLLzZS88Mfh7NFRVwFsdWY7dXmSPWiNHP66M1DsoJkgDWwQHxi6m97nCMs9lyQggVclX+5VgK0=
X-Received: from pjbge24.prod.google.com ([2002:a17:90b:e18:b0:34c:cb46:dad7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e083:b0:361:3bec:fe28
 with SMTP id adf61e73a8af0-376a9de5b35mr35584887637.37.1767135712714; Tue, 30
 Dec 2025 15:01:52 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:29 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-1-seanjc@google.com>
Subject: [PATCH v4 00/21] KVM: selftests: Add Nested NPT support
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150154_896416_073EAB17 
X-CRM114-Status: GOOD (  13.80  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Yosry's series to add support for nested NPT, and extends vmx_dirty_log_test
and kvm_dirty_log_test (with -n, using memstress) to cover nested SVM.

Note, I'm mildly concerned the last patch to extend nested_dirty_log_test to
validate KVM's handling of READ faults could be flaky, e.g. maybe if someone
is running the test under heavy memory pressure and the to-be-access page is
swapped between the write-from-host and read-from-guest?  But unless someone
knows/shows it'll be flaky, I'm inclined to apply it and hope for the best.

v4:
 - Document the likely reason for setting A/D bits.
 - Put "mmu" structure in common "struct kvm".
 - Make it clear PTE accessors are predicates.
 - Assert that the stage-2 MMU is initialized at most once.
 - Make READABLE a standalone bit (don't overload USER).
 - Don't alias PRESENT => READABLE for EPT.
 - Fix the A/D bit definitions for EPT.
 - Drop the function comment for __tdp_map().
 - Add a patch to extend the nested_dirty_log_test to verify that KVM creates
   writable SPTEs when the gPTEs are writable and dirty.

v3:
 - https://lore.kernel.org/all/20251127013440.3324671-1-yosry.ahmed@linux.dev
 - Dropped the patches that landed in kvm-x86.
 - Reshuffled some patches and cleanups.
 - Introduced kvm_mmu data structures to hold the root, page table
   levels, and page table masks (Sean).
 - Extended memstress as well to cover nested SVM.

v2: https://lore.kernel.org/kvm/20251021074736.1324328-1-yosry.ahmed@linux.dev

Sean Christopherson (7):
  KVM: selftests: Add "struct kvm_mmu" to track a given MMU instance
  KVM: selftests: Plumb "struct kvm_mmu" into x86's MMU APIs
  KVM: selftests: Add a "struct kvm_mmu_arch arch" member to kvm_mmu
  KVM: selftests: Add a stage-2 MMU instance to kvm_vm
  KVM: selftests: Move TDP mapping functions outside of vmx.c
  KVM: selftests: Rename vm_get_page_table_entry() to vm_get_pte()
  KVM: selftests: Test READ=>WRITE dirty logging behavior for shadow MMU

Yosry Ahmed (14):
  KVM: selftests: Make __vm_get_page_table_entry() static
  KVM: selftests: Stop passing a memslot to nested_map_memslot()
  KVM: selftests: Rename nested TDP mapping functions
  KVM: selftests: Kill eptPageTablePointer
  KVM: selftests: Stop setting A/D bits when creating EPT PTEs
  KVM: selftests: Move PTE bitmasks to kvm_mmu
  KVM: selftests: Use a TDP MMU to share EPT page tables between vCPUs
  KVM: selftests: Stop passing VMX metadata to TDP mapping functions
  KVM: selftests: Reuse virt mapping functions for nested EPTs
  KVM: selftests: Allow kvm_cpu_has_ept() to be called on AMD CPUs
  KVM: selftests: Add support for nested NPTs
  KVM: selftests: Set the user bit on nested NPT PTEs
  KVM: selftests: Extend vmx_dirty_log_test to cover SVM
  KVM: selftests: Extend memstress to run on nested SVM

 tools/testing/selftests/kvm/Makefile.kvm      |   2 +-
 .../kvm/include/arm64/kvm_util_arch.h         |   2 +
 .../testing/selftests/kvm/include/kvm_util.h  |  18 +-
 .../kvm/include/loongarch/kvm_util_arch.h     |   1 +
 .../kvm/include/riscv/kvm_util_arch.h         |   1 +
 .../kvm/include/s390/kvm_util_arch.h          |   1 +
 .../selftests/kvm/include/x86/kvm_util_arch.h |  22 ++
 .../selftests/kvm/include/x86/processor.h     |  58 +++-
 .../selftests/kvm/include/x86/svm_util.h      |   9 +
 tools/testing/selftests/kvm/include/x86/vmx.h |  16 +-
 .../selftests/kvm/lib/arm64/processor.c       |  38 +--
 tools/testing/selftests/kvm/lib/kvm_util.c    |  28 +-
 .../selftests/kvm/lib/loongarch/processor.c   |  28 +-
 .../selftests/kvm/lib/riscv/processor.c       |  31 ++-
 .../selftests/kvm/lib/s390/processor.c        |  16 +-
 .../testing/selftests/kvm/lib/x86/memstress.c |  66 +++--
 .../testing/selftests/kvm/lib/x86/processor.c | 237 ++++++++++++----
 tools/testing/selftests/kvm/lib/x86/svm.c     |  24 ++
 tools/testing/selftests/kvm/lib/x86/vmx.c     | 251 ++++-------------
 .../selftests/kvm/x86/hyperv_tlb_flush.c      |   2 +-
 .../selftests/kvm/x86/nested_dirty_log_test.c | 259 ++++++++++++++++++
 .../x86/smaller_maxphyaddr_emulation_test.c   |   4 +-
 .../selftests/kvm/x86/vmx_dirty_log_test.c    | 179 ------------
 .../kvm/x86/vmx_nested_la57_state_test.c      |   2 +-
 24 files changed, 726 insertions(+), 569 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
 delete mode 100644 tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c


base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
