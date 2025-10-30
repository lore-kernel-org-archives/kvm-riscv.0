Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D807CCF9F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKZ3qK2NhLuMTMIqjaLecpmobkJ4zMLFst84MKNFjcY=; b=FioTd2WjXPsUBd
	rLrlzHPRIwYD7LnedYYuDJEAm1eSfFNHZuelxzm7N3fBPvINZqBUyQTRsGtiffvvsl4ZR9TrI3STJ
	/sUktwKjRh7Ip/TTAhk6KHP1OA2ho1BijGJWgRnd7Ual5vDLSndE/Q0NdPGbaM36GwFYcCvaAeMr6
	flwQ178s+09PrZKM/csbHf9PbgkKxDoNAxSF2O/MFRLo4XanCmHQ7jT5DyYmNknlssJXiYkmtCkjM
	2+eHikRDPUtny/BbljFOZJhil2nDEQbrBYbsAo9qScvH3s/8hUdGNn8GMh35+8fgIyMvJyscqJmIj
	xHW1jPjWIWIYruqgU9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ0g-00000004mGM-063M;
	Thu, 30 Oct 2025 20:12:38 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyv-00000004k7V-0zoH
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:55 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b6ce15aaa99so1086944a12.0
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855048; x=1762459848; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=q3vUMZT0yYe1EXEiRgC8c4U03xvX09k6brWY3B4yx5I=;
        b=dzKPMF4F1Z9SaFcllfHIaN5K7jMsdgV8GROEwAKF9VqldR9dL0y8FiZ2YnvRV8Nn8D
         ylZfZ5l0cjNXBC7lRq5sNfY5LmeFEnxxRZoIADamHHDdwSnQQFU8Xs4dLIRe+ee0DFx1
         oru1xaBuasQhz+qa+L7Vc5zoBzF0J3byQDuOtyOmc+n2ipKZUqMasqNicP7SY3Ga9fie
         DRbxMClWMHT3SOTIrhqf7+F2/RIwknZbXOGNOjBJxKT9XZ6x7RAzeQEo21teoADAY5j3
         yv0RKU1YfC+XpIXadgwutdhM4mWbe8BzB3IRhsAO22bVR7o4tXNwbh9euiktTHx6YPAH
         Sdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855048; x=1762459848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3vUMZT0yYe1EXEiRgC8c4U03xvX09k6brWY3B4yx5I=;
        b=s43IP3h84lkY5YGDJhifazwOicJncutF4YGaiKdwA5kz7mvt6G2EJD9tqc8qaxSBur
         Zq12sxc1dwHxgwHLZcjhwy1ySWlHp9Y9CwlepFSKRBzvPyoEaYQqG2DieovM6lxfd/CB
         j+k/KUFOdkAS5soRsq/DRUGgn+ac4Wkmm5eRoLB7JGv9IX65CIl9d54ZGz4HJGFdY4l6
         G2yJo7NwYXOFJYYvVHyq22FJFbvRru3pfy7nouR2N1tmjRlBLAk5nBCsjpixNndsXwoK
         O0EZ6WTBX+brk9eeNgk0YyGbsIRzKA2e3GIce6obwnHIClLTG0BFKQ2K7U+DJecTkCov
         76/A==
X-Forwarded-Encrypted: i=1; AJvYcCUfs9byMdDcCksfWfq5MiVl0FrftZOhNw3VJrLzKfj2YsLOgUPk0lTAXToxel8MMNZdjiBLBMPwAik=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVeKCkt9tg4qaz+IoxfyJ92igGdgrVkP834MTBBduzY2L5U/vG
	AME+yVAZQKG1WU5Ah7yrXlwY9N1DMHFxBlVeOTM3kS1PO8fTnjgd2fdLmJvvCGsv1vJs4roAK4F
	o2SUKUg==
X-Google-Smtp-Source: AGHT+IGMIUiQfnFXRwKgU4xakuBoSsZwl0KV10BIrj34ojpFyNKXcMvJLG+bxMBFJqWMl0yCEf0bmf3P3I0=
X-Received: from pltj3.prod.google.com ([2002:a17:902:76c3:b0:294:8e58:7348])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2348:b0:295:1a63:57b0
 with SMTP id d9443c01a7336-2951a635c07mr12598385ad.23.1761855047670; Thu, 30
 Oct 2025 13:10:47 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:42 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-20-seanjc@google.com>
Subject: [PATCH v4 19/28] KVM: TDX: Derive error argument names from the local
 variable names
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_131049_403517_388C6B20 
X-CRM114-Status: UNSURE (   8.91  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

When printing SEAMCALL errors, use the name of the variable holding an
error parameter instead of the register from whence it came, so that flows
which use descriptive variable names will similarly print descriptive
error messages.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 5e6f2d8b6014..63d4609cc3bc 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -41,14 +41,15 @@
 #define TDX_BUG_ON(__err, __fn, __kvm)				\
 	__TDX_BUG_ON(__err, #__fn, __kvm, "%s", "")
 
-#define TDX_BUG_ON_1(__err, __fn, __rcx, __kvm)			\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx", __rcx)
+#define TDX_BUG_ON_1(__err, __fn, a1, __kvm)			\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx", a1)
 
-#define TDX_BUG_ON_2(__err, __fn, __rcx, __rdx, __kvm)		\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx", __rcx, __rdx)
+#define TDX_BUG_ON_2(__err, __fn, a1, a2, __kvm)	\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 " 0x%llx", a1, a2)
 
-#define TDX_BUG_ON_3(__err, __fn, __rcx, __rdx, __r8, __kvm)	\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx, r8 0x%llx", __rcx, __rdx, __r8)
+#define TDX_BUG_ON_3(__err, __fn, a1, a2, a3, __kvm)	\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 ", 0x%llx, " #a3 " 0x%llx", \
+		     a1, a2, a3)
 
 
 bool enable_tdx __ro_after_init;
-- 
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
