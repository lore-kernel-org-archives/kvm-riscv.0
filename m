Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30F4C369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmqEWEWZ+afNypt3xjXOIydy3HEhttZTjXrXlLPw6Gg=; b=H/q5nMUuwSUbKt
	7NLmZzxO/O/zECtsDIHbeurhTBkUf3qLkFzJkm93tpRt8eIhRLWYC/dt6Nh6+jZw+0CB2n5QJbJpM
	ajOgKN/eEgRwlX5jusVJu01GtGmYw86XpmGyfjwnK8OKuxJiy2TE65NS6fXMSsrG92jk0FTusjnG6
	4dBQrsM/s9/mBt9i6pLDA7xDNTNQfDSSOTNQQFHXn7svP5mgIIHytWgkcHYRdwWhBdN8KeCqBH5XR
	ABMQkSaioWj4kmxl/tvGaHjpYZqYU0clADUk4IbIXpzoP/DtU7RR4awMa7Bkh7qukUvv/cGacX4co
	AN3dUNcX8QawEtdxY/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6t-0000000EfjU-1cEA;
	Thu, 24 Apr 2025 16:07:35 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yYy-0000000EVIS-027L
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:32:33 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso1231188b3a.0
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745508751; x=1746113551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryJkTbKAwtM59V1O1MS/WywWNtwvLqWzyl4I1jgJpkI=;
        b=Vuz0HWZ1WXvEehPqo4G9B5d2/tjGVba1T1zbkWPy5CbZVy7kCfWape3YKvfgXIjZye
         cdD2SmAC75YmFQF9OjbrmdLp+yjt4P5c4SXR41wmtkEc49nqsCyVvs8WIPH7GS8XEnpO
         izV10KX1T80Q9CWrQUfhnyLLjbNTZ1RHo9xVnQaMU+rTzIpQvzMwj8Ff6DZcrXh8ECyp
         7xpbsxdo3l9+JAjqGthtIpMLb5R6dEbdaXnTduZ/UmdVxWSoqQK8bA5w/DKR8HFLr8bn
         BvxZcNWWuiWxuDHb4Gs+C5TVwYwX8063f2knMBK3cjlmOzI+gXDaY37bJMceEESPHIsI
         nYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508751; x=1746113551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryJkTbKAwtM59V1O1MS/WywWNtwvLqWzyl4I1jgJpkI=;
        b=YoaGKUuqJ5klUcDLSaxMcTGHiuh3dv9cPiUgj6fQWtgmrr0cxRk/XnoPyN7AXibzxs
         ebj3HJFF+3jy5IXrtTVSRBHl59nuwZAxFbcPELkRf5REhj5+FYyRCfP9qqQs7sBS8NS5
         uPIinE60k7+fpm+oBUFoZskVJKd6GzG5ElineczhCO2lFYaP8BeOUiitYwGC88Zi1vfD
         dobPDSOv8Ed1nEdlcc0s0LQH4Wzw502ph5Nr6TO+rlzfbMF1Gqp53OxqQOMurPp9R8td
         fbwADx8uVj0l/rfDh6eec24M8pR0SbxkU4ebaBy4/Amh4/UnCkOGnJuUrBPEgdd5jzO1
         5XiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8ufzIwIvQPrqAwtrUmRLwe80dkVq1EhqPTpcIeAZ7uGR8vdAbRfA4Vt3NbZgnTYCpqIfG9Yxx5XA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYI3uaEhk4+F1HYMTwR6SzZM5WqRNGwE63VcDzkq3NXhtG3J4a
	E7IgAYlmQIVBmpvxaqeuD/PjaK+bdoQLATtM3idAVguEKToOTG7xNsjH31yryf8=
X-Gm-Gg: ASbGncvS/rwpe0s4+H0Rzo19QKIDuegSua+kBAqqLs0sd6xkI8/VYvNlPmcCC6viTbB
	jG7uidyNTJ/tP7rhtNCXeNNqNlaVb1AovJXZYqDRplX8He1Wfl3+XYyulxXX6Bqf1XYa8E24caY
	1VTWAmym3HzvMd5NqNFzQYkfuFJOnDemn2aSVfSU78lAEEUU8MB+qPg/UpYUq5nb3vxvGA7tGVD
	XVpjAoVqXv50vvZZARzdbNUahG1bjTN/+tK6O50pCl8/v323+lnzV9lEUPYlMwa9DRpcF1qrx/H
	5q+56xiwSenMj8oEvb9zSqX/syxPsRWtRVgYqxqVM7RLiQsRn32m8UenlkCNjDY+z6qREPk4GQ5
	2Xa8u
X-Google-Smtp-Source: AGHT+IGi9mHwnOeEIylVlG/uMwbn4WhtUFI2gns2yYhv2N27LasmqweDzDMmCCIezM+FrydARH7PJQ==
X-Received: by 2002:a05:6a21:78a3:b0:1f5:839e:ece8 with SMTP id adf61e73a8af0-20444e6fad7mr4314102637.2.1745508751087;
        Thu, 24 Apr 2025 08:32:31 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1360610a12.43.2025.04.24.08.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:32:30 -0700 (PDT)
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
Subject: [kvmtool PATCH v2 05/10] riscv: Add SBI system suspend support
Date: Thu, 24 Apr 2025 21:01:54 +0530
Message-ID: <20250424153159.289441-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424153159.289441-1-apatel@ventanamicro.com>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083232_061023_8AF78263 
X-CRM114-Status: GOOD (  13.78  )
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
