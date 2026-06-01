Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59CDCD5BD1
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSVpaj1W2tLNgekN8v7QwkgTjSpt8B7UuZuFvnE2iK4=; b=zPk4EKGmxY8fPJ
	4QF5TIlX19TTq9GYYDUF879kQ7zv6OJM1C0TTeQkL3uu/KhWuPN2CrjdSelG81SpoOb0e5ysy9LR4
	WaSrxhR799JZD8Y4oZcidl3M7P1MQW/NuUXUvkU/BS7nu6BSNAUcr/tOYO7CvuXcopMNTNZaPHxL/
	fYZ4Kr/g9RO3ICYF0KHoM0JCgXL0aI9B3vnyZ6c0089MVVT+nm1vrV+sWzC1n+dHXkNATYfUShgI9
	t7U8/Hy7+atOJJHQ02T+pLApRUbIYWYvHvFdWG9a0NwAT6QvGBTWaezp93LbFJzmarm9YH4vWH68H
	aLFiWFuJsjQK4F6mGUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFo-0000000AOKn-1j4v;
	Mon, 01 Jun 2026 08:44:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFl-0000000AOH9-271d
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:44:10 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so14333755ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303448; x=1780908248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmdSZ4nBLUBMfkWYeMqXhgmIblXvsbFhjdlvAKdM29c=;
        b=GCjcOg4rqLMe3PvmFsZtzwYEKXDEHSueux2B5hkyvrkCNAp2k0m7gKsSVn2ccnBSdm
         iqHQUxHltEgFJshtSk1JWUDMBF0jv5G7U9/+AieftUnLmS7MRZYdsfjD8dmudRcVIEAz
         2SPeE/sTuznnsj9Za8DIECv+v8A3JzRxNKZcSgapTAMpqQES7XSBSViZypNihzq0Shhz
         SVmdAMBaGAMCr+g26GOZ6nmDn5zvJsLwuRQTUXSF+6fDby5mK7qWGC4B3fgzEaCZS9dM
         iqlqvgK3RZb7cabFqiDgmSH9ckoJLxrb7fozQKo20X/XUqtnwiEp6PPfJpM2a3Kf88KK
         7oiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303448; x=1780908248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EmdSZ4nBLUBMfkWYeMqXhgmIblXvsbFhjdlvAKdM29c=;
        b=kSbMwIm0gZ5v0d78GxfVfAdXL1bAi/X12NG1z15cZpUmPGq1tNtXpi+J4aVUtABs0S
         d0vPvWHk8fksTKMWMeJtCaidJoOlmuxdU3mxdGe2Evnq3aNgvnQqnNUMuUXI3v4dwdOy
         LhHdkfrToquOGlHn/+Wa/ZfqlqFX3Deh0zs0JG1aPL0H1AZNCxdCBdupd++XK7pN80jU
         W5H//efIZJTdCq3vTSmiSo7sVGN+C/9H/PfiuwHts2RUzjupmKOyGBPNaGv6hajUY1gq
         ajDZhktMXqG57xVbUNyZ6yvuePmVNHDJ0NSQXQ2mhCB4E2U4/9li6tFIotUlrgB748ej
         VGxA==
X-Forwarded-Encrypted: i=1; AFNElJ+xDKG8qPOs0c7fz8iJ8DNqsrO1OaPzfsbQcJPWs6PohzZXt6vhnNM2SyyYRlR2ZCiCZg97wVeYuSw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMAFEC3kd/wjZGG2gBz52P3PojBxuUjz7mJbZ6EbJCN+rHXsuQ
	6cn8f70C19hvTYXQOFezl9GYCflKKey4LBYjMiBM166u6hfYmYNLAlZk
X-Gm-Gg: Acq92OGoaRpeYmgZEVJtxnGx3HI0qONPyhaxYmB7x2XaIt+G2gWtPiHn1XU4NHaX2yi
	bFFVyHDjBKMzke4NU15EYj+DXuzzdWoD+tyuJoG4Hew5yjtmzMIlMbgs1icBZ3pOyt4HsnX+gur
	hdITIMJ0tB4xi1Nuicb6ygOmCTvRWiwvm1SkGdjKpSnAVsG1ONQZS08ZCcJQTSfWrCRwiOXFv8I
	147nh/TdKcYNJIeDQkmgbdEQZZaQYZnsGrpuRBK1ORu3Mtp0P82M+vadgijVYu4CKa5iN+/k1gN
	E97LAvUXxPUsUqM2WyQSJR8YUCNicna1PArIM8kzGM3s8TwzjXs15fXHKUklKqR6tawnKAm9uXQ
	MxImpfqztsnQyHalrk0YUxcAnUqo3iQGkFvdConXyAL3BEvafNIHSrMhe3TLQlEACO9NGe7xvqm
	F3laTgR33Ms3iRkzXw4rIE0zKYqGN8qslkTA==
X-Received: by 2002:a17:903:3585:b0:2b0:b016:773f with SMTP id d9443c01a7336-2bf367c21a9mr124575685ad.11.1780303448528;
        Mon, 01 Jun 2026 01:44:08 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c43f0asm137898535ad.77.2026.06.01.01.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 4/7] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
Date: Mon,  1 Jun 2026 16:43:32 +0800
Message-ID: <20260601084336.2601675-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014409_559718_5DE16DC5 
X-CRM114-Status: UNSURE (   8.98  )
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

Extend the KVM ISA extension array to allow KVM userspace to
detect and enable Zicfiss/Zicfilp extensions for Guest/VM.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/isa.c              | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 501e4fc60dd2..9f9c5ababd1e 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -199,6 +199,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCLSD,
 	KVM_RISCV_ISA_EXT_ZILSD,
 	KVM_RISCV_ISA_EXT_ZALASR,
+	KVM_RISCV_ISA_EXT_ZICFILP,
+	KVM_RISCV_ISA_EXT_ZICFISS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 1132d909cc25..9852a91fdecc 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -65,6 +65,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOP),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICCRSE),
+	KVM_ISA_EXT_ARR(ZICFILP),
+	KVM_ISA_EXT_ARR(ZICFISS),
 	KVM_ISA_EXT_ARR(ZICNTR),
 	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
