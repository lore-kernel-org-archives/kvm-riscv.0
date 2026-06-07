Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA5ECD8C92
	for <kvm-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wC9dzTu3JoBront/sOfPF9lMwt+18ixkD2zALo/Rc8w=; b=a7mwq25kdHytZr
	92gGMCEMM0cu1uF+9opGtgy4Zh5LqoDfW+xAbB1gi1gBc6aCMm9PIFMj/KycrBYElhympGwGHp+If
	ZeJPYKP4MwQSBvAb14pS58Pexe70hn61PqL9pxk0ndvLlsgeI6RogwN9MUBWhMqOJ3c+PZAwD1RCO
	TW80MY8At5dhtmNZX5A5uUsgZETD5lQmWc41aR6UANiv4FmAPiupwKUP6CJYma5QRUu0d6C82s+kl
	4DhWRQQWMQRBbsE7VegTphdGJ1TTDH4OpSzeIvO/whUNPt3uGWyTFy3CBtyGoNRzeL4Iei1L7OlBc
	FKNQSxJ0I5o5CD9aAAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bU-000000027NA-1zfH;
	Sun, 07 Jun 2026 08:11:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bS-000000027KQ-19P2
	for kvm-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 08:11:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso22454405ad.1
        for <kvm-riscv@lists.infradead.org>; Sun, 07 Jun 2026 01:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819889; x=1781424689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzHGULD5HxqQOVF8zdlCFjzG5/aQKaT2bot1mulDc9c=;
        b=cqxUTxnX2E5Rma7q/OqBQzDIm09JBeeiNwy5NgIJtw0WSa4qYpYjltxuKXYAqwi5ik
         jx8wzPSDZEF3TTwqfudBExB46ZdUA8XRAFIIyuQl1FHOUzbRwxELasbRVJi1ujqheFTN
         GdA7Pqi+GxFfLGgU76QWY1y996QUFXn3SFGCFLfTp1BcBqqHzF3dHfjVBfjqJVDq4qv7
         cwobzHFB/dnLrRRdGWfdvOIZvOgUh0vbCAq2xXo1vNbG/g+ipEdDeVb7rcBdeI2FGgrn
         uZOIg+IoD3oDpOzE1LZfWkUYO55s7KdIqfy7NFua3qnHOlKcZk3sxQJaJ9qA7wFYoME3
         uQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819889; x=1781424689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JzHGULD5HxqQOVF8zdlCFjzG5/aQKaT2bot1mulDc9c=;
        b=aOPMPUKai6Vab++gplNYvUgblAVEW5eulDan6mzIa7+i3WqTq9gNSHgU1EysJnvxDG
         uaZtE4X5PJJhB3dvoRcUYbTUSOJunbbPOJgpj36KeemQgDTcL1jiXThZT3ZaMBdYFEOg
         9PBY+TrtITEtQK7EoLw/gMIlwPqn8wkR78BIreVl4J8HpCFlWBrmg74n+oup55v2qYB3
         ZP07RidKulZxZH3O6dbCSRSzhvOdcJjxv5tjlV+HwRf7bQeIwX7pVbDiSpg8dWBLrxSM
         prvYMueOsNcD58lr303P3A3mVdptKRtvVxFV7D2Jipi2TSbuVm1LtknDl80CJ5nKWGCJ
         jJuw==
X-Forwarded-Encrypted: i=1; AFNElJ9yHDChxY2k8KPkscbuYuAbL1OxM4qplItPJrVoGUtDDFgwQDDjaSL5iADfhxC2dNXDbzL44WqVlg8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWvcFSPC1fDdsu9VnSl1g2kP5gHupjjpdpN720EbI7PIj0Fn3i
	iHfFPla1vII2nCZghPXuWYZT1ehNLEDfBPSSFujcX+vgUKQyh70+CCb1
X-Gm-Gg: Acq92OHo9O19SERox/+4/yCq0Q8FXAy+Fm8bqwwnTG40yUKC5WwrEYlFAx1rjfMpRm8
	qV4i03jW6iS7C85dj4tireBVf/TnTp37oUxG4/BMvV0GiAumIP95blESQ5v0iquUcn2bwK+WXbo
	k0GZozrwNznatWfBzuGHC+YuHzQPV03bO9z5X0jaW4TEDtJbnJs/ODnqe8P01HBYHU6MoasFCiN
	HQvQfR0+mwayD4V1xdzQm3eAt36gCognoVIdgA0TUecAhKX62TaKo443YEsxH1mAiB4eKnU7cVg
	w50wNdUxHnWHSyI46wwxPsKnsrubRnyosK4ecEJ/hgLxAEPb681HqUlwkEH8zf0MzKEfpb47YRc
	xUjoh9cMLp2dYaucRmVwdC1Me2qWXuRctzoJ4omoWLuqwkM0lJ6KfXdl3RWHGB0xl0OqREPCdVW
	SKAvFG462uNhYfVhqrIpvD9YzUm5kga9BKxQ==
X-Received: by 2002:a17:903:4b46:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1e8979bedmr117765615ad.37.1780819889340;
        Sun, 07 Jun 2026 01:11:29 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa3a5fsm152139445ad.36.2026.06.07.01.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 5/8] RISC-V: KVM: Handle software-check exits for VCPU
Date: Sun,  7 Jun 2026 16:11:01 +0800
Message-ID: <20260607081105.993908-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_011130_313430_51B651CC 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

The extension Zicfiss/Zicfilp introduces a software-check exception
to the privilege architecture. Delegate this exception to VS mode
when vCPU enable Zicfiss/Zicfilp so the CFI violations in VU/VS could
be reported.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/csr.h | 1 +
 arch/riscv/kvm/vcpu_exit.c   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 31b8988f4488..224af9facf1f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -117,6 +117,7 @@
 #define EXC_INST_PAGE_FAULT	12
 #define EXC_LOAD_PAGE_FAULT	13
 #define EXC_STORE_PAGE_FAULT	15
+#define EXC_SOFTWARE_CHECK		18
 #define EXC_INST_GUEST_PAGE_FAULT	20
 #define EXC_LOAD_GUEST_PAGE_FAULT	21
 #define EXC_VIRTUAL_INST_FAULT		22
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..12eebeabdf14 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -243,6 +243,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		run->exit_reason = KVM_EXIT_DEBUG;
 		ret = 0;
 		break;
+	case EXC_SOFTWARE_CHECK:
+		if (vcpu->arch.cfg.henvcfg & (ENVCFG_LPE | ENVCFG_SSE))
+			ret = vcpu_redirect(vcpu, trap);
+		break;
 	default:
 		break;
 	}
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
