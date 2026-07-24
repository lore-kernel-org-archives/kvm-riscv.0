Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C191C531C9
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 16:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MDibv9Py89My2ZMroCJBo/2aG7pX8Yww4Tnecs2fQZo=; b=GjYA+SRQDwYYzJ
	nIUx3Ui1QLJX8od/Cl2J5ckE6XX+2rdwpXq8JA7mhzp99sf0E3f767f5NsSWoIbbWLc2XNAEYYlfw
	RrsoqZk29buj0RovieF1t/BUYUtpk9X3AgvItxTYYs/HBSqdMuEHYfrDgX8BH8kjRqYcKq1oAxjo7
	et8LxRUkjWvYDtwAMydlmBvwe03hXdvP1Ig2NnynMEnz+jNHiZ1TNFyLKeXRd8YDl0jIMUotc8L/b
	tNMZj2AIl3BPLTU08aqtBD1bbm05/IMaaMUJwS16NNGTFDZYR8iGJZ7Y7VSpGz3bgVarWy3Y+43bf
	7rb13U/oMIx1ts4Xu7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6J-0000000GsWj-42lU;
	Fri, 24 Jul 2026 16:50:19 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6E-0000000GsVu-2qzW
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 16:50:18 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6aae019c09bso390758eaf.2
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Jul 2026 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784911814; x=1785516614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YBM0KGHFm+ZJJiHai+rkJEmg+pEOOVRs7ENpJ01Wvqg=;
        b=Af5HngSqwQJnB9uFKAiw6DtlV2ha2rc7vXnedMoKoEWkuaGOgfjUdG9gq6enFm4Pa8
         m1bRUD0SHb5bx/M9pU1NNKbAZNTEN93sjMcS2YbXfHxUsdLo1/XDw2uq5x9SoGbhPjeU
         A+8R6q7OX8c2L8lUosxiBwO8XrRGsJWUJj3LpVBv+X94L+KWyj3Gtcf6hZkaQck0pCzQ
         gBXKmq1sWNFsALTowq6QXuQ+boxg4AGur5iLl1jkwhsxeQft7q5pedWI7Iw+hhD9Jl3q
         oOFeTnlQVODCo2DyPWGGH81GPT50eLlyfF9RkFtCdY2zoFs+ZV4sjWFpEkub7Gz14gef
         kPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911814; x=1785516614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBM0KGHFm+ZJJiHai+rkJEmg+pEOOVRs7ENpJ01Wvqg=;
        b=BEeUeKnIoLV/hlSzDo+KNWgZ2rLJCiJIRKepbgbZgEws82g5hoGH8ztxMeeVmCXmWG
         3z0j/lQGC2vXXGXNSaM1krlHHOaV13jnPuvNaoViYqusKovROwshS3pBeimrWGghjYjf
         mnuemles8pH+YtGHIlreKSt4ls1EtP6BKUbCDmTC36YiB2yEhylhqRud8qH304AjlJUa
         Y6FoyEvfybFMrXg3B7K4aTC5SX22czfWr+nUOcfvbzqz1ygxDa7ziF+ZL+TapzvBDlUI
         8HVRBLA82FYacXFKzQSnw3/n9efRNyFBdtxcFQd42FwLco0Y7YkXOs7giHpnBGRrUE5C
         wJ3g==
X-Gm-Message-State: AOJu0Yy8rcxId2dQU0FEJ0+opQLE+osGnHsJX7reRfXQM1c9yGLASpAU
	oGVeXnrJOeoJexnDjIuGh06nEES3YK9cFk8AEZiqUysXTd/Aiqo9eiJN4pWjlUkhNiY=
X-Gm-Gg: AR+sD12VvULVherMUannOXORiFNjSnskwdCWL1wKDSvtgDNQTa5FZtZYdSWrEUUvAg7
	SiWpApAM7cl6pBpZ0QfgxbO30djnVeR6oXHF4pb/G9P0OScaxM1Q5phbtzPpQdl7hhlQuprYY5W
	VSiwjJeUlenkzG4hBO82szMtc8hIPbH9XDnyEsQ7OIDP5o49gaLNC+fsEsf/pgIvH7CgL2MtteK
	qjMvNrmCp3QS/UyhLBJeObZzPzBPGyFA5PCh0IF6s/DtqgGTRv2ILuw/R4qdfyuWPGB4tHU82fM
	nSpcEw0atfnJhAaDOGky7AYj1tpHSdlR4Pw+K8ii91utkdt7pA5XOtG8Y9O7cDrElIgf6/r8qFS
	gUHcjvTMMnjlXdgCF9dz1VvQmmkIh0qffLPW0NBKjrAYYxXbDCluIRm1GBVzvNn0p5jCgaVCmwz
	cXaf8GSFJOqMXO77dc4KglboisATedd3hqIeU=
X-Received: by 2002:a05:6820:4c0c:b0:6a3:74fd:a86f with SMTP id 006d021491bc7-6aad3f90de9mr4702136eaf.9.1784911813572;
        Fri, 24 Jul 2026 09:50:13 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf96f4501sm210882eaf.12.2026.07.24.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:50:12 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v3 0/3] RISC-V: KVM: fix vcpu vector context handling
Date: Fri, 24 Jul 2026 11:49:51 -0500
Message-ID: <20260724165001.2317788-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_095015_382773_33DC9359 
X-CRM114-Status: GOOD (  10.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

This series fixes a vtype corruption encountered when running perf +
vector workload on KVM.

The root cause of the bug is that the kernel-mode vector (KMV)
misattributes the guest's vcpu context as the user's context. To solve
this, we need to correctly save the vcpu context when the kernel-mode
vector is serving a guest.

However, calling directly into KVM from RISC-V generic architecture code
creates a reverse dependency, which is problematic when KVM is built as
a module. To address this, we introduce an RCU-protected callback for
context flushing, which KVM registers during module init.

Patch 1 is a preparatory cleanup that refactors
riscv_v_start_kernel_context().
Patch 2 prepares get/put_cpu_vector_context() for gaurding the use of
vector in kvm_arch_vcpu_load/put()
Patch 3 implements the callback mechanism and fixes the context handling.

Patch summary:
 - unchanged patch: 1
 - new patch: none
 - modified patch: 2, 3

Changelog v3:
 - Limit the export scope for {get,put}_cpu_vector_context()
 - clears RISCV_V_VCPU_NEED_RESTORE flag in host restore to prevent
   leaking
 - consolidates guest vector restore at returning to guest to prevent
   unnecessary save/restore between the preemptible window from
   vcpu_load to vcpu_enter_exit
 - Document flags added to riscv_v_flags
 - Link to v2: https://lore.kernel.org/all/20260715051629.1169645-1-tchiu@tenstorrent.com/

Changelog v2:
 - Address issues pointed out by sashiko (2, 3)
 - Link to v1: https://lore.kernel.org/all/20260711015835.767259-1-tchiu@tenstorrent.com/

Andy Chiu (3):
  riscv: vector: refactor riscv_v_start_kernel_context
  riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
  RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector

 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 +++++++
 arch/riscv/include/asm/processor.h       |  8 +++
 arch/riscv/include/asm/simd.h            |  8 +--
 arch/riscv/include/asm/vector.h          |  5 ++
 arch/riscv/kernel/kernel_mode_vector.c   | 79 ++++++++++++++++--------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    | 12 ++++
 arch/riscv/kvm/vcpu_vector.c             | 22 ++++++-
 8 files changed, 129 insertions(+), 33 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
