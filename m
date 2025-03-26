Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E07C36011
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFiO3ntrMhQpVx4XlixjaubyhwiSVRMPYsEC2AOPK6w=; b=0iYdHdZlrR0Owy
	9TXefh5JCEpVfEkcn1kCCmjTHtWdzU38dHLYuyCBbWPHhcqWhBtfe6YvStfBYhkHV8rh1BBfNS34m
	5mSo1FmqFQi6/BL1DL5blF7sfIaEKstVpkonhGkTIKA2is7fX6d38Qzj30GXhht9pUTviice9QCD8
	lae1d7E0b58YcL1z7sDobwvJ/OWm8rDVmPyMsc62n1c/NO3VYWqMMf6z2dTviDdlcdwHgVSy1h+CT
	koHb55prsCuoJEAfpcd5TFfmr0y6heU1G+HsEC7ytP0trglw2fAMrrh28kSo8HkZS3688fBZGEduB
	z1/we3D5rnCOknbSP1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKia-00000007iO6-1BqP;
	Wed, 26 Mar 2025 06:58:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKhH-00000007i0i-0cKy
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 06:57:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-227b650504fso70575645ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 23:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742972226; x=1743577026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLEKqRLWfjNWO1Y3LXL24I6Udo4pWSqiBjtsFWDKELE=;
        b=iHPiuPSB4RPsaR0JNcClIUIA7NFwjaQJqmv7+7xfjBZVPaoOC5xBO36m59K/NoPBdw
         2IsiEOiftXwRSmoXvc3lPzQoW401EN3NcAZ5Um2QuyWsVh2VzH3CnwSBslsDEUH/gaHs
         Cp+YWGCRGYNTdDLJ0D8+x70OK0mRDrbalUmYMofd1W5Yu6KWmekHtiL99JEHPOP0ZtY8
         wm3K1lGRN4N4KuMN+INYVMyATxa8vbccitq0fx0iHPGdGllDWxLt7su5oCuqVS59f6+q
         w/SDcupX9726/Xw//uU8OtVtCgW8qONnG00Iixgkj/jGmMgO6eYAYEHSbP3TXGB6fD6n
         RjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972226; x=1743577026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLEKqRLWfjNWO1Y3LXL24I6Udo4pWSqiBjtsFWDKELE=;
        b=h+E5vE2UehjbpQyt5xObBLZD76UTWqfAZvW6SWWofbjxP16+6riR3Qkdnd8k4ErG1Q
         rGRqltVLPHA21Y3aIFdDBOy25jepf9zwCfYIQWT/wbwWglcR+n1QK850xKihzCzi6K+x
         pusVOOOZEQnREWxSqldv8uoPw3FpfOohmCO8wcH5BL67ASVWPhPwEfmXrv9jp9YcGGMI
         dJ/tNt3673IRE3CfBaMaybWZCM06Luv8iqgzfUGqlRKqsdCI+KGYrU7Nal3o2Xm2e5c+
         i4MVdcJIgwSQLjlMWy9tpHIjXp64xAW1Ucc6FB6ZhOpJ4iFbQjkuuiRW1DTjuhThZMCb
         EUoA==
X-Forwarded-Encrypted: i=1; AJvYcCVneCircf++BdSRu44cip7Nw+uITFDILn54puQOCyAVod/lgwPu/rikHvp/KljSghfVx/ly2+5jTA8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTfSLZtfdHh6bmFSXgCRiJXExTz9iNhOnuZg0SPoURCd887uXZ
	z4OW5HloKq+qgvyqhW4wGA6vGyh0jONAiKEKt6YliwIFeUFGdqNvRxybMoeJqP0=
X-Gm-Gg: ASbGncuzP4rowp0hue91ahxzNaVCLoWVbXc6ZoIl/sMhyhQFjjZuIo6adfa/n9Cd1Y6
	cTNfuht7gT4vIq9sVisvsOEIcQD7Gd8j5kZoWHGcQQ9KVR0HWQBo8+nhumB44tkZEbdhlqM/Wff
	ej9rG562RJbphpGlyInl3UnxNf4ymWMrXbdNqGGL+KMtS/ltFwsToUApoUcOyzl2bEJf8w3ntEV
	4sx2ZLB5MtwaJ7NN9Pg5iyi/daRl/H0V2j7Gr3vW2ZgYOiiKH6Px/qvIoeKMJB8h//ObUTCFasY
	G4NDNM3GUdx8+JO8Xc50+FubWFRNUZhL3HTu5CYu+RdaMW11Z1M19E24fUghhruTCCruM0K8h9O
	+gVdoQw==
X-Google-Smtp-Source: AGHT+IGXY3LffBHOP/txcrjQdMCWm5HHhSPkS9j9uUWBO3DwQkN4QXL93Ox56vzpd7i3gf8NiUBNTQ==
X-Received: by 2002:aa7:8881:0:b0:732:5276:4ac9 with SMTP id d2e1a72fcca58-73905980abcmr24766474b3a.9.1742972226153;
        Tue, 25 Mar 2025 23:57:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm11788817b3a.105.2025.03.25.23.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:57:05 -0700 (PDT)
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
Subject: [kvmtool PATCH 03/10] riscv: Add Zabha extension support
Date: Wed, 26 Mar 2025 12:26:37 +0530
Message-ID: <20250326065644.73765-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326065644.73765-1-apatel@ventanamicro.com>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235707_184370_EBEA3ACD 
X-CRM114-Status: UNSURE (   9.28  )
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
