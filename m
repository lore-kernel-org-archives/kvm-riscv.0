Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6799FC369D5
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRLe7O4/0ppYvy5XLx4MkgJ57uyLIjfs+SX21NWxPXc=; b=CwPyZ4JkeR1aiy
	PXTDLHykpOdlrzYqaUKwD4XAalsWwKJc7e1tPFqLPQ1iGywgqnBlw97TAP4KxpZyj6Lqh+0SGz8AZ
	Hd2/aO+juYHxUcpRT102kC2FDs8OPSNqme52WxCRJLod+oP1dod+wmbTfSTKpgjOUmzWLWKVyKizj
	uD1d57aXx+/uGFnb5+lAU8qvDQL2X0nHwhJ0nAVvJO/7QQ6lVLHxUKkXU3p5wGFNM4zEimPq/NWRg
	VlH3ukH3eiHXZMoCOWktjSC0Et0/FqBKQY9di4kGu27pHi5hQUjXOCZRQE1irGrBOef5OsNjd0dl9
	itGpd4f7ArN2TYVn2DNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6s-0000000EfiJ-3f6O;
	Thu, 24 Apr 2025 16:07:34 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yYt-0000000EVHF-09VI
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:32:28 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-739be717eddso859784b3a.2
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745508746; x=1746113546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izVZE3MINqb+sB5P+aMg5WCU4bsWOfV4in60wkm/uDE=;
        b=MMh1Vt85KYq8f96ff/fHo1nPDwMrgD3mgJK79RK27JcMNROctGL8N2yfywXcv18ZTP
         KYwbFq9n7tyIRI9XoiueQo2Auxl2rTZb+AWBRtH59SMG9tPD5BCJkDftCilWOUlWezGq
         QlHie6RXiff9GALmtKc49pfYZnBFPy9X26L60+DFDHoYVIsoOfx3gyi+lrF4aqrDucBx
         dufd/yUPqoLAcUqve68QmbubYNH1WIwVdh8hmHy8zjSnDntLZFqvbZMrkfRFdgA7lXyP
         wBNPpNyHZqD25hCaMMl3FAYbzJgfyzlvIbBGwREBjlfL+4Bub47awvhK4NTtIIj4gfud
         FVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508746; x=1746113546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izVZE3MINqb+sB5P+aMg5WCU4bsWOfV4in60wkm/uDE=;
        b=DFpIdXDzKkMU8OUz57VqTnQ2iateCNcYjvdBgBKy/s9KRlQI3NT4AgavTSJGz4pxK5
         U85ZQuoS9OYk6LKRCAVlxjK5N6kkNpG14cbTcLE8NY8KHc1HRV0GxgQh/zeqR2fA7x3F
         W/HLGgyc+/a7cnh0XKNpCgWQ8Jf5w/yMcehn1VcEl64ustzInkMl5t3wcw7zJFLIrur/
         uOiAhlhDwYyzWNx/H/T6cmTpFvhzOkkdqBUdMwU7RBzGesbOqkNxmxexZiJJpliWAzSb
         U/HAPsz4ksnQhRtnFLX2oX1Ewsj7V5n3ZYVcz1yM+y9qbaULOd3pfA8Mjvtfe+vQSsks
         BA8w==
X-Forwarded-Encrypted: i=1; AJvYcCWnnEagBV19QCD1dySIN1bA5psU+DpIfGmGl+1ivVHCXVTVPfAkGLL1BGt7/kn5Tll7MkHFgelnWz0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRMzUKs5zcj/E6IP9bSoD6Q6twFZHrW2DCK3yIdRfe0KXpzkwy
	2idckosb74MlaSL+XxPGoUPD4ZKW/ooeppHlN9Oz5lvXryjJiIbLQkoa8k89gmU=
X-Gm-Gg: ASbGncsnadbOBlTPGG8ZDG6J+do7ZbdutMJMSbX8EWOB9BetsNBCSXzLCpEXuG+yJ38
	F+ALt2PX7aUr3lqiRNtYBNbWEULAquWDqCRQfyJZtQCzyfY1Uf4h6VdeZYreik0CqpvThDO3Bh6
	usslSNsg0+2EQ/DRMH2ppWqHe1k1I1GnzZH5n2ffvQsoIE/qJ8Zu3rYavTNpSY577yvKwYk2H6e
	M3a/azuocl/TkSKWamFe/mMW1gePf8gk0o6R8EPSgtws9/gHOhIOe3vTpttjhzLlVfIksDwN+dS
	DtwAkFqMfekgG9RreUYv1dL603HKs6wJ3o+IjWh/KlA6uxjC8Vh34VRIyekIRVFYbJ6FpNkDGKv
	AtpwZ
X-Google-Smtp-Source: AGHT+IEIo+KQcAt4FBEBc9biRhcHayIF0n3hD0byvs4INh+54nGh8ILdZYKcnUAKj0+pbTQOyH6fKg==
X-Received: by 2002:a05:6a00:8087:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-73e24afd361mr4472196b3a.20.1745508746281;
        Thu, 24 Apr 2025 08:32:26 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1360610a12.43.2025.04.24.08.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:32:25 -0700 (PDT)
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
Subject: [kvmtool PATCH v2 04/10] riscv: Add Ziccrse extension support
Date: Thu, 24 Apr 2025 21:01:53 +0530
Message-ID: <20250424153159.289441-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424153159.289441-1-apatel@ventanamicro.com>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083227_069848_1AD80CF5 
X-CRM114-Status: UNSURE (   9.31  )
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
