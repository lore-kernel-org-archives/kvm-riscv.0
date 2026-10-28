Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9EF606A31E
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 19:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xECnwBgM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HFA2Yfl0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jv0nugtASbbRrPxvMJhOP9jqPOErOSpZLPcIGyRxzsI=; b=xECnwBgMlLCtpqfjkynNS0U3uJ
	p84cjsNneprVB/AhxVEPZDm84tGRBhjAl5salxf2HhGJy7pgeNBik9A7HykoAq7ncQVACMue+Yfuj
	gsX+Lu21n0NmDkUbe4307gJ6m0XYW+LqTmiP7dc8cYZbttFymSKS/wH4B88jN0Me2dytv9Qo5M0Sz
	GVtEX2YXiPsrczWUBDvn/uTBQNdqTMYNuuQPcdUUJWfkGMe/u3gKCvN9//mGli441S09ZOzQK57FC
	x/QFomx/xFU7YGFQGV6ZmfrC2oOYjPqBdPTcRaKMkxXT4hAVOTNRso4AlbRaOq9Nj3hrNbCv+cezy
	lo/W2moA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vT-00000007nTq-1pea;
	Wed, 28 Oct 2026 19:03:07 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vQ-00000007nQ4-1n9M
	for kvm-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 19:03:06 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so1719935b3a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 28 Oct 2026 12:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214182; x=1793818982; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbuVr5an123e2WdNsh7qTkraPx2QUzUAuDpOvbvX5g4=;
        b=HFA2Yfl0qTJoOMyX1RF+lgP0cNFt0v3VklrJBm/bwhrhtGoif54eXqiLCyZbqdYjUJ
         wDbRXgK4m/EPZ+bVpVihufgVinKMNCJkP7prjsRFuWB33BJhASxOPPy7hePY+dAgTQk7
         igoULsaOSHbmXeJN+hB2Vx23++Igt9cxhK+2unp9yj+YuO6uU6xef38YIE+stZd6Sms6
         RBin0/vCt2kh3IEwv97vOB4FqjW7FJXqlJ94H/55tI8zQBTVHnUtu/SpWoX8EIo4kuI0
         lLAz8uMDJkwCCZe4oI/lIYnsKpgY1a3NQ9NcGHHlsaIROSaxvFwDylfnEvFBavdcTKSj
         8E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214182; x=1793818982;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HbuVr5an123e2WdNsh7qTkraPx2QUzUAuDpOvbvX5g4=;
        b=pptGEm+32CBT8M19A/AIsVXhHDpUSogxkxd/UnEsP824zj592kE1xlJBdSZ+Vr9Pcv
         02kxN7eHehewe14OY8V6H7S99JpXD/Wt0XI15/GniRIK0I2LEJIk1Ir2cHXMpg32CUZw
         Kzw6kF4FMyv2LMG2sebTtjH+lyzhsCVHfiyZxBTfXWTqOxtADr/ZB4JNYHas3V9BJxPj
         XjJ2djJuvBtbrInUvQn60ghyDoukIfNidr2Fm6RtLKii4CJd3AKFUpGeVwSVDxK9QqGf
         24ku9DcVInh2iKn/71IVyY4pIJcarboTl9222AvsFwxcJA5wkZwFUYujQOxwrHURNJgO
         eLZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoxfPnnMCoZ4vi9q3esmiAoDocpXc2ycFGPaeKJ9W/5ut1Srqy/rlIAUlXIf6HLgUxo8MztsILnfw=@lists.infradead.org
X-Gm-Message-State: AFq9FYLuXOPOPtAC/53zKS34AYtMHHV9pDuT5bIGfrmi4FPi4tQys1OL
	HAe2KPWrolf8CEdfPHyVtda/n0ePSZKGOQ8e8EaLwAxuEv8Xf/TcRBfIANkT3tPK8CoAIe04xGH
	7LZps3A==
X-Received: from pfog22.prod.google.com ([2002:aa7:8756:0:b0:8a0:7e84:9992])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:18a8:b0:899:55e9:880b
 with SMTP id d2e1a72fcca58-8a6e72dc7admr2727923b3a.14.1793214181492; Wed, 28
 Oct 2026 12:03:01 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:02:52 -0700
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-1-seanjc@google.com>
Subject: [PATCH 0/7] KVM: Ensure WAIT requests actually wait
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_120304_466760_73950FFD 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix a bug in where kvm_make_request_and_kick() won't actually wait if the
kick races without another non-waiting kick.  The issue is that all of the
conditional kvm_arch_vcpu_should_kick() implementations are missing this code:

	if (req & KVM_REQUEST_WAIT)
		return mode != OUTSIDE_GUEST_MODE;

Thankfully, kvm_request_needs_ipi() does the right thing, so this doesn't
affect kvm_make_all_cpus_request() or kvm_make_vcpus_request_mask(), i.e. it's
limited to x86 SNP's used of kvm_make_request_and_kick().

To fix, address this TODO:

  /* TODO: merge with kvm_arch_vcpu_should_kick */

and purge kvm_arch_vcpu_should_kick().  As usual, PPC makes that difficult
because it has wonky code that is poorly documented.  For reasons unknown,
kvm_vcpu_kick() unconditionally returns true on (most flavors of) PPC.  To
preserve that behavior, add a compatibility wrapper in PPC, along with a
@force param to __kvm_vcpu_kick().

This series would ideally go into 7.4, even though it's obviously not small,
as guest_memfd in-place conversion massively widens the window where a missed
kick+wait can lead to the host trying to reclaim an in-use VMSA page, which
is generally fatal to the host.

Sean Christopherson (7):
  KVM: s390: Drop unused and unreachable kvm_arch_vcpu_should_kick()
  KVM: Add a @force param to __kvm_vcpu_kick() for PPC backwards
    compatibility
  KVM: PPC: Explicitly force IPIs when directly kicking vCPUs
  KVM: MIPS: Rework kvm_arch_vcpu_should_kick() to use standard
    implementation
  KVM: Move kvm_arch_vcpu_should_kick() to common code as
    kvm_vcpu_should_kick()
  KVM: Plumb the full request into __kvm_vcpu_kick()
  KVM: Drop kvm_vcpu_should_kick() and use kvm_request_needs_ipi()

 arch/arm64/kvm/arm.c               |  5 -----
 arch/loongarch/kvm/vcpu.c          |  5 -----
 arch/mips/kvm/mips.c               |  5 -----
 arch/powerpc/include/asm/kvm_ppc.h | 13 ++++++++++++-
 arch/powerpc/kvm/book3s.c          |  4 ++--
 arch/powerpc/kvm/book3s_pr.c       |  2 +-
 arch/powerpc/kvm/booke.c           |  6 +++---
 arch/powerpc/kvm/e500_emulate.c    |  2 +-
 arch/powerpc/kvm/powerpc.c         |  7 +------
 arch/riscv/kvm/vcpu.c              |  5 -----
 arch/s390/kvm/s390/s390.c          |  7 -------
 arch/x86/kvm/x86.c                 |  5 -----
 include/linux/kvm_host.h           |  7 +++----
 virt/kvm/kvm_main.c                | 28 ++++++++++++++++------------
 14 files changed, 39 insertions(+), 62 deletions(-)


base-commit: 7e60162b16f9da0d2fa83da5c1723b6853a0ac1d
-- 
2.56.0.313.g2479322e68-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
