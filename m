Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BC3C369D8
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVha9NidlBo5zCvEIfFE7pJC3pJP/24Wma1hhrSofTQ=; b=IPiPW+fKPpLN4e
	SHRz1Z2yLcn4lyDd8PFNHjY4yjAONybjbEhMGnT/43Xe5FArBhaVzcQDDXPDfbXu+i9akI4S6oITj
	FNIPyWkPwVDR1dYK3pb3icerMzJ/ECX6mHHsQOxSIHbx29UooYZ9Hij41EJsLkP+zPsGoMsOb5JrB
	p91odIlES2ZGQnnVq1HLzKWeL9Jeuv5BtH6Xl2Fytt33ljxwDF10ofK8ab5QpzxEWVhwC14LPJnTF
	OpEAF/IMkkXXin6N518CluoyNKM9kP4IkUMvRapNbcpWpxbTEw3a3NxM9z76hm9ZrIFkjhsH98r/2
	8dRAB8lYSySARYMPR8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6s-0000000Efhe-1tSa;
	Thu, 24 Apr 2025 16:07:34 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yYp-0000000EVGL-1NRx
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:32:24 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so1022605a12.3
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745508742; x=1746113542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0IwKIyhJe48lUgNI7YxfwAQ5b4aIzLCl3JBaAqKrgA=;
        b=jQFPmxxVsfbB0J9hNGonJoV+rVuApsIYnI6Lx0+awaOZayx/CTk6VKNJ7wTnBSfC8e
         ekKkyiIvt45sIp43NNlpaBJ3md05/HjR4udB2ujp6/yBhw8zmW0zHHvh74eI0I0rajAL
         OhBsD26r+n5GsienYnCj/4q0JOF4qAonTzbtKVx6PHDilcGYB21nCO8rnXTNfWUts2D/
         wOkqy7GiTyULRqpXgVAaqHlFboXPtpDqTZCJaaNFmtyka3cy/fERrC4h9YWtDI8bkzgY
         dUOTi5LnXJSA3npMsInrzvYytJgA1X+a1rusFdCxPAgH6EVsWpGVGP93p/2xO4FDZy83
         4+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508742; x=1746113542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0IwKIyhJe48lUgNI7YxfwAQ5b4aIzLCl3JBaAqKrgA=;
        b=cpfjfAap27euD1jHDWSSsW7IJGhJIxE32w2bBHFM5jPXYcFXek5LKX5eIBu22df3SN
         uMV6GBmTnU0xM8JfRFvuQfmthfHr5jAR+JWM4elQgK+/yLTyGnRSY+mlqL3DE1eJuwMt
         LJfGyFsQobzAYb9fuVsZ40TAFNOO99OVRJ3KNlr1ZUrJuRPxtD+smtdGGMFM0MrRMf4L
         /ET+jKg1pQo3aoaBp/FoSnll2DpRWlAcRs29cEDWg2ChT3Mw9q+/heXWoC7W/xN3BtCa
         ueRtB1xGi8ObSs/s5n6nhFA6rEElFZpeKmCNqOl4t/VgOF+kTQwD6uFsfdLdvfYCV1+H
         3a6g==
X-Forwarded-Encrypted: i=1; AJvYcCUVzjJL1C23MXPsfeUOfeXNcO6fIEfRX12mncS32kkSKeCKmdF17GvSGbpVQc8Cxc+8YKCLqsvWBec=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvTVd7LsxvtkdWalsMbETtsg7OyBuoFAMwHNjLwBeP3h8EgfF5
	BVAoSKprPuk/Ese2exwAxj8Bq60M5+jjdnowWzguUvXmPinwYo0nS8AP7/GNYaA=
X-Gm-Gg: ASbGncshnbjZEgcnIW3h/fuE9jndo4Ae4FclTwB+O5nHAt3PIaBPc0GM2+DUv7cdM/m
	ou1OVKC3E4EMV6rY2GvN7FPCrMz0s1OHTu426g/qKBnStXr6QNKowWOMYimtQM1thuObTXiSf02
	LhZWQiuXL+4cFUi36+pfMTKhuxidhgXU4GAsIYJkFh+S10JfOiAkqTgOIZpSbzM3fy1U+RhcyfO
	nYaiTEIVB//FI2PrrwjZBQnoC2cZPQ3fm/QabXCQQhV9tpzu3KFl6b6nnLEa11XSIn/GUaIaa6Q
	KUQSwBIhqV8QuhP6ydTzLhFzzQxbm+8HpIAOet+45VsmALQkmN4BXTezf0c3TXZkbsajYohR4Z0
	AdfT4
X-Google-Smtp-Source: AGHT+IFqUwAdYQm6RR1he8AWnRduhYm8oDtl2Xyb6GC02q2qn/lBuEeE5OoIuJrnbDInb+D4TZkF8g==
X-Received: by 2002:a05:6300:218c:b0:1f5:6f61:a0ac with SMTP id adf61e73a8af0-20444e7b205mr3285038637.5.1745508742164;
        Thu, 24 Apr 2025 08:32:22 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1360610a12.43.2025.04.24.08.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:32:21 -0700 (PDT)
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
Subject: [kvmtool PATCH v2 03/10] riscv: Add Zabha extension support
Date: Thu, 24 Apr 2025 21:01:52 +0530
Message-ID: <20250424153159.289441-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424153159.289441-1-apatel@ventanamicro.com>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083223_362497_CC50F972 
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

When the Zabha extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index c1e688d..ddd0b28 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -28,6 +28,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
 	{"svvptc", KVM_RISCV_ISA_EXT_SVVPTC},
+	{"zabha", KVM_RISCV_ISA_EXT_ZABHA},
 	{"zacas", KVM_RISCV_ISA_EXT_ZACAS},
 	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS},
 	{"zba", KVM_RISCV_ISA_EXT_ZBA},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index ae01e14..d86158d 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -61,6 +61,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-svvptc",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVVPTC],	\
 		    "Disable Svvptc Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zabha",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZABHA],	\
+		    "Disable Zabha Extension"),				\
 	OPT_BOOLEAN('\0', "disable-zacas",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZACAS],	\
 		    "Disable Zacas Extension"),				\
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
