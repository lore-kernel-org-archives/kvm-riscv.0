Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC01C369D5
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 11:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRLe7O4/0ppYvy5XLx4MkgJ57uyLIjfs+SX21NWxPXc=; b=eykajYmviiiTIB
	7EW3EsMkv3Zykdl4gQwNU8Ai49KJ4Hbo3RvBZHX2FODy7UIcGHqbAMRUEP6IsfCXIIBf7ihubsldz
	kqDusHPefKUYeiiwApzkXK+lDhGxdAUbyZ7PuPj4Y9yx137hKCVroTEumAFADuAjNn1dP76FpJUY3
	vDaEikkSzy0L7WzkytnCVTVMBkhRyPPlXgfr1iV10UgVGdD3OjBRUhBtsgE0/1AEyQGUytfBXxN7o
	HRQB9OkrLdCs3uR9Rwqx6mIHW/l6oXlez+A1VBcwpOixJc32trwEtJ6tHSP8uihPm6udtyMYwWTuH
	KMcopnjegBts1ZYVD2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKW-00000001txP-310n;
	Sat, 26 Apr 2025 11:04:20 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKU-00000001tw4-1KDf
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 11:04:19 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b0b2ce7cc81so3167836a12.3
        for <kvm-riscv@lists.infradead.org>; Sat, 26 Apr 2025 04:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745665457; x=1746270257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izVZE3MINqb+sB5P+aMg5WCU4bsWOfV4in60wkm/uDE=;
        b=UMBvfFX7UOaeCcIOfkJRC/pugFYcO3fy24W1zLBh/ARm/iWKJTVh1iCQdRJJzLU50y
         Z+W9Td8scbVLtBNJ6Rbrv3d+z8xVkFML4V4t+vOmkWDOWuYfpcJMlzxRgLmo2CUPQfCV
         QqACMGwqY0XyLQ9YJOJC3YAwkDy+5et7lkJRdI/2uYXa8hohQcMYN4A1N/FYVm0llN3R
         TAyMpKgH65tRC8R6iuqAX4L0Kd8dHHGSrW/8Sd0Ci8UM8/LL+gtvVYoTDv5a8XpSHfN0
         bPlREtBXNqr7JYhZqcbGC+kVJ0uY8s3JZQMcHcArxN9VKMBCn45ah1BP6W2XL8nTel11
         krlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745665457; x=1746270257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izVZE3MINqb+sB5P+aMg5WCU4bsWOfV4in60wkm/uDE=;
        b=VIkolu7NRcnHxECOK+QLIhZgbuFlIGIW+IH3IWIXqnNPgVW89FvNQSqJ0zxRD7Ha/X
         cL8y4iCygcr1+g+aWeL4Vp4leKSzHQxmptTMv53OpI3aT2sZwBdz5NOY8zxBbsAEtXJ6
         SWr2YyFr63+JmOvuZsVtbbqyBtonDiNmpJdY97Kp2mKQRa5BOVYVqAoJXciVNUYwaFb6
         MPXaWJiAiPySJGiDn4hnuQOOiAM8NisuTinYl4JcVY3TZYe0WHfaS/JAMFC02KPz/2Tx
         p9M/K+sQtzp9r2aAKAkGAdTJx3WmvVyedANyS21VSoh3vIWR9Ys4qCJ3xqGZOpu2TPGT
         f2CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiNiU4BlAwUTN4TkmRh+G/qcxXeMP7nhhVNL7KwoXlVFOhbGACrVWE1nlpz84L8Oi2+VOEBjk1cy0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzF32DGjnJZteZuIktSUECzxkQFRyaU2uBIDkrptXinwC5NevnL
	yatojn/EDo0U1p5bXoC5ug/nTcHTJ78yvdV4R43anPe6div72Qmx/LvMjnfdh9E=
X-Gm-Gg: ASbGncsewoVTyHmBj4Ho74btT61hh0pmDkeaKitCJ6sjnGnLL1aq+i2CBcjKsAMwt3E
	Os8BCp1AFm9Gj9KHK30tKRCqgUFEaqgloKAN85pcDAER2Kh1FLRdJdu1oiCKK24mwUImpl1+S9y
	0yYxu7iU6hoeKYPgVtx5SKtsMgT8EwygsQa9nUbQKReZJvZlcpthlbR22p3Hpijma4AigSDIUfP
	wCHBAyZjmw2eT/xC+FV2qeht/C//EA3RVTVwiDcJoK7LNSyFZKvHSzXEElKxr5HF2eyr2yEL83p
	G8kdrABWoLz/iV903tiwzcOW17wj0b2HjWMyPKcLo4B6yo1hqnjI/Uq+MHIPsmsc6S0P80HxtFJ
	85Y3o
X-Google-Smtp-Source: AGHT+IG9EHq/xB2zNOXuLSF9BV0SIkfLVwrgKN8lCCWUKGV9wk6lqP9f2yss0VbScLNDw+w5niQchg==
X-Received: by 2002:a17:902:fc46:b0:224:179a:3b8f with SMTP id d9443c01a7336-22dbf5fa5c1mr85746525ad.23.1745665457249;
        Sat, 26 Apr 2025 04:04:17 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc8e24231sm10956725ad.125.2025.04.26.04.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:04:16 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Will Deacon <will@kernel.org>,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [kvmtool PATCH v3 04/10] riscv: Add Ziccrse extension support
Date: Sat, 26 Apr 2025 16:33:41 +0530
Message-ID: <20250426110348.338114-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426110348.338114-1-apatel@ventanamicro.com>
References: <20250426110348.338114-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_040418_349701_B7C4D4CB 
X-CRM114-Status: UNSURE (   9.27  )
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

When the Ziccrse extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index ddd0b28..3ee20a9 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -48,6 +48,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN},
 	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
 	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
+	{"ziccrse", KVM_RISCV_ISA_EXT_ZICCRSE},
 	{"zicntr", KVM_RISCV_ISA_EXT_ZICNTR},
 	{"zicond", KVM_RISCV_ISA_EXT_ZICOND},
 	{"zicsr", KVM_RISCV_ISA_EXT_ZICSR},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index d86158d..5badb74 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -121,6 +121,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zicboz",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICBOZ],	\
 		    "Disable Zicboz Extension"),			\
+	OPT_BOOLEAN('\0', "disable-ziccrse",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICCRSE],	\
+		    "Disable Ziccrse Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zicntr",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICNTR],	\
 		    "Disable Zicntr Extension"),			\
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
