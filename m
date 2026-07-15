Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850B6C44508
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 05:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pVO0hmU0tyu2qhJuldt4V/BzTxdOxI6qzZDCm2LKGOE=; b=U8Jkl+WMKBDgxF
	gf2MLfQSR2QpYnBAHee7HEXyXbg3QS82pKExHRSZR2qy0W9zI1adNbdU2UtxsoxIAUbK8k6HtaR33
	IctUvj7VWfUx5crS57U/xrysc98xFbG0vD3UEHDIKvsmgezx50/EPPKYkwxNTBvU2/xOSPIqQg+Hi
	3wn8Gt/4cT9+Kq3pGpd32g2FXSkHjq+b4xJY19iS1fPLUSQ5QK9fh27CpP4R9g6kl3OD+VgnMrrMl
	3j33y61bIXbPzkjCzhu7Xuknky3paW0IczxcJb17ULX8fC80TJrbW7ngiNbRAGx4vjrJtY8vDZf4L
	gffOZE3YEjD+0+SmVumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrzW-0000000Dmgv-45pd;
	Wed, 15 Jul 2026 05:17:06 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrzU-0000000DmfJ-0W9p
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 05:17:05 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-6611669cd16so1838357d50.0
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jul 2026 22:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784092622; x=1784697422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNLVT1fVgoho2VbuT114oTcZ59SH+ODJq/573N6mOo0=;
        b=O9Wot1MrR2W1BcJL/B12o7ofMtUdHCmIOQRJnPQ3vOvg2g+V5OH/7AhJVh1XXpGOFi
         RHvuJCyIRBKeJva6adphXhGozN3YxoC/4E91otCDmfQeUAzOaVhB+/edw31em/IY2gul
         6Oj9NI0DYLp0SuMz0MjSHBlHlMHGj/i8bwj8WGznLiUtOzeoXHEPHzNGlZVQoDw1dI4F
         y1UxiUseXRCv8obVDrp5bqL09H/p7hbusidsfQwnlXDxVZ3rk1PTOwn5/epq+JuMa4rd
         bjZWv2K2Bvl+GQSvYSs6w7hsxJMCWYgirgVCyrgGlxsvG9sWOLyfrGhrdAt2P/NZSsfQ
         kgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092622; x=1784697422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNLVT1fVgoho2VbuT114oTcZ59SH+ODJq/573N6mOo0=;
        b=Gkqzmyhv3P2yzZNjpDdVjYHqGQve785TEGahYQXdw3ue5Du79QJDsD2uJIcqXDQldt
         9xR0wMozAta8R4v6fSR6OQlhC2Z3Dg2QstF4L3M87uCYBAfsyLP7ARJLI7i5nD3y3ha9
         jQxIXYRMoI4eDgjfEC0ca7KxY3WgYOwyr2gXeuTMejo+nE4vt4ZJBjJxbiwxR0a2FLgi
         O+WoAoGEhF6euCKKdwIeSjXv8MuagpE/3qB1Qwzvgvp683wxkoOc3Meq5Ka4my9QUPwu
         HSpEcIWgNT1gLxtBPvgZ4ZQPuuCU4+1zE5xH+AQknXHXVDdDL3Bi+yt6wHBAisorjVDV
         06kA==
X-Gm-Message-State: AOJu0YwpCASb0BZfllJOrjVkLRnCnMllM0ilwYu3C9r9sMwcPSEFculy
	gY7seyzHQn06X3q/ftOX/q831bMbeYDwDNUII27lo91bPRhDEvkkPqbv2iNa0+4vh2g=
X-Gm-Gg: AfdE7cnk7r/JmvLZo8sg41PKxUL+ZPs6IY3YSnmqr1PbN3312IWyMvgdppwjnWeZwYj
	GjGY8fl5JB5k/F/iJn4vH0/ZwTRwp1tESARQstODQWpXzjEMtnMA6XtKLztq2GocFYe0vgv0rzK
	uEUMu53wqOuyEc7iwShNwAlj6pi6JYq/d4QqkcdE2QaqmyZMyKYGWeGZ0B4IsS2buQNPswZhkY4
	BqMIl7ak8mQtE9Mc744Enk8soAR1BubOwcKH8V/zI52Ti0qtI43dIQwrH0AMmIwNSUoyRsUvV+g
	lMWRvXwMKZ3mIdfm4R7J7JF2VtzFjkutoPrU34814jLsvxd6tRNnP1W0uWYDZEAXGx+pw8x0Fqq
	ZvYhDF7tibK0M53HDlZwu54Rab9wZ5EBCOsAdKBVi19qUkFTeQuIUZio7kfJEwNyLd7ZzYtaytf
	YJdsIzx9Sq/zSR5QBiQ8oOIBlb+k79o/d50nslDM48b5YHD+X2tjIo5aVCXViKbrc3ZuqsGYsba
	Gy+blrWCb8Q4Iz4IhVgc/Fxslq/9g==
X-Received: by 2002:a05:690c:e3c8:b0:80c:85c6:8987 with SMTP id 00721157ae682-81e902f38b5mr123274547b3.70.1784092622493;
        Tue, 14 Jul 2026 22:17:02 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm159625657b3.46.2026.07.14.22.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:17:02 -0700 (PDT)
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
Subject: [PATCH v2 0/3] RISC-V: KVM: fix vcpu vector context handling
Date: Wed, 15 Jul 2026 00:16:19 -0500
Message-ID: <20260715051629.1169645-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_221704_168571_208A2C08 
X-CRM114-Status: GOOD (  10.12  )
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

This series will create merge conflict with my v4 [1] series on syscall
optimization. I will send out a v5 that has the conflict resolved once
this series is sufficiently reviewed.

Patch 1 is a preparatory cleanup that refactors
riscv_v_start_kernel_context().
Patch 2 prepares get/put_cpu_vector_context() for gaurding the use of
vector in kvm_arch_vcpu_load/put()
Patch 3 implements the callback mechanism and fixes the context handling.

Patch summary:
 - unchanged patch: 1
 - new patch: 2
 - modified patch: 3

Changelog v2:
 - Address issues pointed out by sashiko (2, 3)
 - Link to v1: https://lore.kernel.org/all/20260711015835.767259-1-tchiu@tenstorrent.com/

[1]: https://lore.kernel.org/all/20260528190927.886558-1-tchiu@tenstorrent.com/

Andy Chiu (3):
  riscv: vector: refactor riscv_v_start_kernel_context
  riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
  RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector

 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 +++++++
 arch/riscv/include/asm/processor.h       |  2 +
 arch/riscv/include/asm/simd.h            |  8 +--
 arch/riscv/include/asm/vector.h          |  5 ++
 arch/riscv/kernel/kernel_mode_vector.c   | 79 ++++++++++++++++--------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    | 10 +++
 arch/riscv/kvm/vcpu_vector.c             | 20 ++++++
 8 files changed, 121 insertions(+), 31 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
