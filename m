Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B474C3600D
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmqEWEWZ+afNypt3xjXOIydy3HEhttZTjXrXlLPw6Gg=; b=3cIySeAl9sCbda
	Tc8f5leoFx0kTm286OyQ+hQ/AQXiUZ1Fk5h7AjQajZ3SF5dTIgtGfjvWC30AV5219KL8oGTjJAdsC
	Q0szD/pgA7BQdoi/ioxwFXOCP1aPXuetU92h754N/ts+EuOeKuep7LSjFUA9Vqtt4djoXDdOB44zI
	9ShRrjqTkp4Qidtojcf4ggj2TQnvOtSYZIwCXl5ZdkkX9CFl8xLplRvAZkVsOKoWkJqumQDX5HWWq
	fy5XPGwPhHPXadoKo6MLHP/k+nZU8/muMiQfK928Ni+/Dx5j5nkpAPYl//0FzebHdoEYl74ICZsIz
	ofFNNQwiQ/87SpIg+RPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKib-00000007iPG-0pUc;
	Wed, 26 Mar 2025 06:58:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKhN-00000007i2q-2zM5
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 06:57:14 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2243803b776so12758565ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 23:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742972233; x=1743577033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryJkTbKAwtM59V1O1MS/WywWNtwvLqWzyl4I1jgJpkI=;
        b=WRXOxaQH1pUpIx2Od9r7sETr2bGrCAtJ/k1UOCjxMFSGj6Q5X9O+wdjwCEDfEIp8v+
         s0QoCq/0GFWghQ5P6yKgwFEWcCNeSzGgk3Qn4+4uV0/J5kmUSZ/SSXPyAS3Ma0MN8W8/
         ECqUng7xmGANBWT1ZaSGGmV4BWa2BBxVbjWcXYpSFvMmbvJ4/MJEXK7R6xOHc2b6/NJ6
         N95mA8IWqHlRE2uj7kVUiGIgvyLlrrtXI6LBM32KCBt4HC1OczslH1j2ACJKofMuR+Y1
         VdpsubPbPIJvj5pPNIZU6OnvOiGWUGnZTYRK0OHo9xeDbSMJVMb5zvwMELvRkrOtTZaP
         kaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972233; x=1743577033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryJkTbKAwtM59V1O1MS/WywWNtwvLqWzyl4I1jgJpkI=;
        b=WT8Pfp/d8hYDZV1rdhrO52WPVMu/V+YTRErDE7PXMXh7tLie6vQ2LNRZoQZN4Guc1x
         ngwXKhSZoBVq+eLNn1ctcdJTnm4nSJTLyr0cmau7zatui6oXhCDu6lpGiaTBn09ooD4b
         dpX/bvC8kMCgFyJAgPM87BZZPFRam8tEdhASsLApYiC73qIbFVlIKNN8MKbArZKkyIHs
         B9WC7kuS1pD7Rfoj8oCNQLJETpVfMdW7S+5Jga+oX8zhJXp5GkQb3VAvHxEalDVuwGoi
         p5wFiiril4BBhnoFDl7MAAmtOiz1SRppbWeyh+shEnj8yFcU16VDFFZ6JwqMtVMHISnV
         9y9A==
X-Forwarded-Encrypted: i=1; AJvYcCW7sFVHuOP+5vTtnJlUYpUPw7P7sEpQuXv+AcJpfxFAi9y6vt1anmjPzlAjWPVYEM+gZ21v/yRX5UU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFWKTvi1RitNo9eBaYtS/JcZ+iRl8GWYwctiNTVkTM2wCOhj/9
	Q4E3+E5yTvaYFdYtwIKgWA7thNQXnw32uYdR9vLKslQFDPUt1l1Pjgn55xKwrTA=
X-Gm-Gg: ASbGnct0U5+59SqgtQC5nzx8JV7jBNFazqlDSWTiXZZ8o7XYj/uaS/fYvs4XunHorwi
	LP0gJAo0c6fLembCR3xnxV9X4z+5B/EeWABc1dDhz4z4rA3bfOi+3d5uzRzMsIiwtVWDuaNhbjI
	8f0kPY9WJ7dHv7WG6Fm8E7/Ao8xozsFyd/M8W73jM6PFFqmAqt8ra0xGpFnM+0vzexrVmm9Sn0H
	/HHT67R7HvJP6fiZVW8wFgGS3MQyq/kmmCrqcjc/MidIwEIq4nHkV04ldmM8yeoE4s1FrEp42jm
	CszkPMbOWuAxap8VoKxeu4flL3pJjD915ZkjfFm3Q2A57J9VidJPMbNwHSUAtRAseg71LCXx1Sj
	bn8QL1w==
X-Google-Smtp-Source: AGHT+IE5H6R3DTm7xbphAfgfH61QBnKNsHA6xAmpxpqbylWoeAt+hTlvTQPfzix0WAdlMrob9mLXig==
X-Received: by 2002:a05:6a00:808:b0:736:55ec:ea94 with SMTP id d2e1a72fcca58-73905a5255dmr35474402b3a.20.1742972233107;
        Tue, 25 Mar 2025 23:57:13 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm11788817b3a.105.2025.03.25.23.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:57:12 -0700 (PDT)
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
Subject: [kvmtool PATCH 05/10] riscv: Add SBI system suspend support
Date: Wed, 26 Mar 2025 12:26:39 +0530
Message-ID: <20250326065644.73765-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326065644.73765-1-apatel@ventanamicro.com>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235713_751762_45F95D50 
X-CRM114-Status: GOOD (  13.84  )
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

From: Andrew Jones <ajones@ventanamicro.com>

Provide a handler for SBI system suspend requests forwarded to the
VMM by KVM and enable system suspend by default. This is just for
testing purposes, so the handler only sleeps 5 seconds before
resuming the guest. Resuming a system suspend only requires running
the system suspend invoking hart again, everything else is handled by
KVM.

Note, resuming after a suspend doesn't work with 9p used for the
guest's rootfs. Testing with a disk works though, e.g.

  lkvm-static run --nodefaults -m 256 -c 2 -d rootfs.ext2 -k Image \
    -p 'console=ttyS0 rootwait root=/dev/vda ro no_console_suspend'

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/include/kvm/kvm-config-arch.h |  3 +++
 riscv/include/kvm/sbi.h             |  9 ++++++++
 riscv/kvm-cpu.c                     | 36 +++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 5badb74..0553004 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -238,6 +238,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-sbi-dbcn",				\
 		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_DBCN],	\
 		    "Disable SBI DBCN Extension"),			\
+	OPT_BOOLEAN('\0', "disable-sbi-susp",				\
+		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_SUSP],	\
+		    "Disable SBI SUSP Extension"),			\
 	OPT_BOOLEAN('\0', "disable-sbi-sta",				\
 		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_STA],	\
 		    "Disable SBI STA Extension"),
diff --git a/riscv/include/kvm/sbi.h b/riscv/include/kvm/sbi.h
index a0f2c70..10bbe1b 100644
--- a/riscv/include/kvm/sbi.h
+++ b/riscv/include/kvm/sbi.h
@@ -21,6 +21,7 @@ enum sbi_ext_id {
 	SBI_EXT_0_1_SHUTDOWN = 0x8,
 	SBI_EXT_BASE = 0x10,
 	SBI_EXT_DBCN = 0x4442434E,
+	SBI_EXT_SUSP = 0x53555350,
 };
 
 enum sbi_ext_base_fid {
@@ -39,6 +40,14 @@ enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
 };
 
+enum sbi_ext_susp_fid {
+	SBI_EXT_SUSP_SYSTEM_SUSPEND = 0,
+};
+
+enum sbi_ext_susp_sleep_type {
+	SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM = 0,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_OFFSET	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
diff --git a/riscv/kvm-cpu.c b/riscv/kvm-cpu.c
index 0c171da..ad68b58 100644
--- a/riscv/kvm-cpu.c
+++ b/riscv/kvm-cpu.c
@@ -1,3 +1,5 @@
+#include <unistd.h>
+
 #include "kvm/csr.h"
 #include "kvm/kvm-cpu.h"
 #include "kvm/kvm.h"
@@ -117,6 +119,17 @@ struct kvm_cpu *kvm_cpu__arch_init(struct kvm *kvm, unsigned long cpu_id)
 				   KVM_RISCV_SBI_EXT_DBCN);
 	}
 
+	/* Force enable SBI system suspend if not disabled from command line */
+	if (!kvm->cfg.arch.sbi_ext_disabled[KVM_RISCV_SBI_EXT_SUSP]) {
+		id = 1;
+		reg.id = RISCV_SBI_EXT_REG(KVM_REG_RISCV_SBI_SINGLE,
+					   KVM_RISCV_SBI_EXT_SUSP);
+		reg.addr = (unsigned long)&id;
+		if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
+			pr_warning("KVM_SET_ONE_REG failed (sbi_ext %d)",
+				   KVM_RISCV_SBI_EXT_SUSP);
+	}
+
 	/* Populate the vcpu structure. */
 	vcpu->kvm		= kvm;
 	vcpu->cpu_id		= cpu_id;
@@ -203,6 +216,29 @@ static bool kvm_cpu_riscv_sbi(struct kvm_cpu *vcpu)
 			break;
 		}
 		break;
+	case SBI_EXT_SUSP:
+	{
+		unsigned long susp_type, ret = SBI_SUCCESS;
+
+		switch (vcpu->kvm_run->riscv_sbi.function_id) {
+		case SBI_EXT_SUSP_SYSTEM_SUSPEND:
+			susp_type = vcpu->kvm_run->riscv_sbi.args[0];
+			if (susp_type != SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM) {
+				ret = SBI_ERR_INVALID_PARAM;
+				break;
+			}
+
+			sleep(5);
+
+			break;
+		default:
+			ret = SBI_ERR_NOT_SUPPORTED;
+			break;
+		}
+
+		vcpu->kvm_run->riscv_sbi.ret[0] = ret;
+		break;
+	}
 	default:
 		dprintf(dfd, "Unhandled SBI call\n");
 		dprintf(dfd, "extension_id=0x%lx function_id=0x%lx\n",
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
