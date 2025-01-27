Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026E7C02188
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EiBz4++aZgbf8tBppvBYZvT3nP6qtE3r4wNYS2SpQ4A=; b=V8XXjupmFFnEoX
	P/SM9r4rZkQjqghH2X9MXY9C6fzgLbbm6agJioGMbdxd4YPU7QIcjn/dReK5+ALRnHwLxHFf9ZbI1
	ZZUAQU/XECoHTcgE23nBG5yCjm/qI7eMWZM1FQQd2Zfr14YTf9q0qcB6J+DpSSamu7PTtSIof1MBu
	gGvejcwaISpKGV4GdZVU+a8F/1DttiWp1RXV4erRiX7sixfX+8I2dZ+LtqwSz0gdLPmsqy1WMgjRh
	bonc1sdaWBA9AfxlAYPqHSMRACIR8rePk05mqvgOBdNhFRHfyivhVBfAKCngKp/5msAfbonOIQ8fa
	TP7pqmHnC6UwfidKiNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6q-00000002MXV-3DU7;
	Mon, 27 Jan 2025 13:25:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6o-00000002MVv-0ukK
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 13:24:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21649a7bcdcso72415835ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 05:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737984298; x=1738589098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyFuZqIvuoPsi26fo27XHmOKoN8l213UJXn990xuuSs=;
        b=oxsKusBvx4VdsDu18BwezzcAmQOhvQW869kuCTrGA6ZxtQxO95dOxUHoQ3aq4khon+
         3RohkuEbq9OqlfMw6yh60lpde9OTmr2HolTjBrJgCyr//3DXZ7dzNAGw3AVBWY2ywaif
         VVE+nQZj3LhFjDdl+w90a8issE5/7DfAEba5MFvRVR+q8IBf80dWyBjNCImQ+zzcdCKr
         PKjTo792Kkhg/9XEr7pkHNF/C0epACxl71rltVorPaVId5rXcrGAHnJBl0KGJHS4BP51
         meJTNYUMRI57QJW00XVdDZCdtk2fXIQIVS+EszUih+PiqMEEgy6zgIT/nyzutBBG7ZZ4
         LJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984298; x=1738589098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyFuZqIvuoPsi26fo27XHmOKoN8l213UJXn990xuuSs=;
        b=qiSS+Q4LbUhMZKc+1BCsHJwbewtM3CFD23lJukXJcGXz6TvEcJV2iukQpGrfJg32yY
         A8cDOqs+2cXZ2Id+xu9JO6LXZY/yvxRy1r6RSEnXeaQrAMnNt8QFOc3QnSlgJA1p2iZm
         XmGh3xtWv6oaPkW5s/GMtLb00t20XbWiQvOs8d/wGkEP9SVBPdk/m0ZxdJtwuKA/q7Cv
         Qa3l5C3mAHn4PnDvuuuR96AH99C6niGyAMQqlgCihRo2VkKVZfobQOw5pjV/EeGoj8Jp
         GvMsu8CJTnAF+q0ZzDqslUtZcA3SGcIt+I8PcD9vk/zMzG7yId4vrsMjlYE31KYLhSmN
         HGCA==
X-Forwarded-Encrypted: i=1; AJvYcCXaDQHknDXz67iUdH8uEuQlKzDg4M+BYDD0+z9Y3aVVe4KAT7mxck4QgOgkZ0/ZBLT1t7t7EjCGuKI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyor4mPCtcwcjbggzZmPG30/yyKHGfx54ev32cjwIJTRZ7ffl4i
	FUhJz2qXDToPAB5lyuD6WFKP++iMZyC6SpfW+CH63sT+v9Z5DqBUUWFBd3MDFhE=
X-Gm-Gg: ASbGncvsI+u7+heUfUz4af7XB66SaabYEbejvL+2Y/a8EPtmAI+sXwB6uaAomm+zf4M
	4bi8/vnBHg7JPIyVmx9+4K0X3EJUv2Qj9DgYZxoJMjouxplEJbWydViRGVf2FnLY5uRJM2PJfG2
	4vtUqES8+Yl43FLQRfe0P4cYs7w2XANtKjff1PXl7qMmNEQMV5+Mi0GLxLDHIDMZ+b/qfnULrZB
	EOo26TXS+FxHW0pKZFMyMbTPgDRkuPLLl4FVpGFdkp1PSbfwjb6HWVPiK0k1gP3CIKO81wjuCBN
	WcTTTFFxvXDiYCUYYNii83usPo4SGd5AMUPKqdzm0Wex
X-Google-Smtp-Source: AGHT+IGOPKbsTzAU6PPUvasAKPUIG/JEo/1wHILrRnaRRTp6n6q6iQVr30ZLF0hpFh9nTgyji8x31Q==
X-Received: by 2002:a05:6a21:7882:b0:1e0:ce71:48e0 with SMTP id adf61e73a8af0-1eb215fb27cmr62751726637.39.1737984297604;
        Mon, 27 Jan 2025 05:24:57 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b324bsm7268930b3a.62.2025.01.27.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:24:57 -0800 (PST)
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
Subject: [kvmtool PATCH 4/6] riscv: Add Svadu extension support
Date: Mon, 27 Jan 2025 18:54:22 +0530
Message-ID: <20250127132424.339957-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127132424.339957-1-apatel@ventanamicro.com>
References: <20250127132424.339957-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_052458_254659_60E5B4BE 
X-CRM114-Status: UNSURE (   9.21  )
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

When the Svadu extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index cf0c036..7f774f8 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -21,6 +21,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"sscofpmf", KVM_RISCV_ISA_EXT_SSCOFPMF},
 	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
 	{"svade", KVM_RISCV_ISA_EXT_SVADE},
+	{"svadu", KVM_RISCV_ISA_EXT_SVADU},
 	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
 	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 5389dff..e3eeb84 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -40,6 +40,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-svade",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVADE],	\
 		    "Disable Svade Extension"),				\
+	OPT_BOOLEAN('\0', "disable-svadu",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVADU],	\
+		    "Disable Svadu Extension"),				\
 	OPT_BOOLEAN('\0', "disable-svinval",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVINVAL],	\
 		    "Disable Svinval Extension"),			\
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
