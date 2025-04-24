Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8CBC369C2
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXbhtHzYMkir09O/f5ZJYkLduwfLZ9W9tQF4PWX4z4Q=; b=nahC/fHvx1SIiG
	f5SlFa0xefnexP3QvOeKZqvPNICnFISC0HspXe9O3/Yiub5M2HXm+BH0j5QLyZGB73ePcZqcWpUBS
	XTIVqqqLe+FCuCxgJjTm+vKfPei6xXRcguo8+JMxrcn7TLs3/xRXlH1iG60NzzxC+F5pmgS0Aj9Gx
	rHepi1wFWePVuc0Ko6EC24GUmQx979WNXHqztvr7SAA5mnbUhJYQOvJjIXxIW9zLfrfISQqac/RHp
	AWoaJCuFuUNBeUF9G9py8Sija6D4JH+2lHODwzWMQNoDtFvQUFijeiU5Inr9dg74JM081qErUV7kD
	+TmW0xlrxDvRcd02ptRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6t-0000000Efkc-4AIM;
	Thu, 24 Apr 2025 16:07:36 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yZ4-0000000EVKM-0EBe
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:32:39 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736c277331eso2325839b3a.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745508757; x=1746113557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpgStyTcu6ohuguHcXTsVTGNp1bnGO1cAa+NtUp6vks=;
        b=TNbt9qOwbGdi6oYQDRp92/xEgnhUGTfjP6hqNEgvrD3BCeim4daD2yQfiXxF9R2xiY
         7OqJipRDethYou+Mh3ILRiz9RBHLt9nLF8EJkIVKCD3NChPR7UzMCBAhnuY+0AxhCcSB
         GwQW+ntRm8Dt1cr+e/FrlwipbVQhaNIF/2jc9pwvvFm3C2zWMEBU3smoikuqvpwWSZqY
         Wf2bJOxzRPT2rMoQxUULyFsU8nAwMAIjG/a8BKTnx2HX3rNjHFztYoMtBjUChRhggiiE
         HIH47XzkEu3E9MnDEQrK3IMHK38wqHLctiHIWA2GxeaIxYijwR6jJlzZCWlNnfiCpfTv
         SRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508757; x=1746113557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpgStyTcu6ohuguHcXTsVTGNp1bnGO1cAa+NtUp6vks=;
        b=BgDe0rXUO6GBPHd9nJLwFG6K5HzRGjIeIhjvv+WuxMSd2iZ0IVat+iHhhtmLfIe61W
         CcXcXg1xQe0FnHvaL/lnx2Z45SXP/lH9MljwCe4SeMWTQgUqb+0VmQfDdTm/HbZnVwHM
         omvgGVNsW5bjQAe5+JT+dCoGgWKhpr45hZNE05UoOkkfn79FRnc5ajwmJYFzuNt8pp9L
         gUljPmeSMxeTnKpFE6xr/2sCFP9mxB/45EnSsfCFiQNCs1VMLs2DjGooy45XhfbIq2O9
         RKAdNd1FP9UoMUuicefWpB5YbgchAJAVnJiSa3mZBEw3EhI2FmXllJf1UaQwsT3i1q6F
         8m2w==
X-Forwarded-Encrypted: i=1; AJvYcCW99Y/9wOfcOP9Rn0uqAsVeoQrTRmP7NylNLmUuBGs0+4mO2cbuXMOS3LTZSmazLPo0Hd4wHe5T3O0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVZjELiAKCFPb1qw9Ev2ZOF/lLCFw1Dnf++yw5QqTfz7Cn9oiu
	AhEdhsqGiGpHkMGJc4UwVUiB98Cqojnvw0Qf55nzTVmNuxpMQdK5nhFYSDibnMw=
X-Gm-Gg: ASbGncsZfrfSco0jO4QG4dzogCVaAk3A7Sz45NlQonH+tGlOtBSUkd+a4mN4xI+1lMF
	8BnmEOyKwrDrgsSeSrG7gga6uU2gSXpVi/RH8fN8VcNUGuOBFKmjFnudi8rAu4Z1Nn20gP76YZ8
	fJNs2hYOiLMg7sRW289D5yrBe5jkq3RGfXRsFHuGHNyq3VjfImZXQIqdMYe535RQO9xO2rNOXyJ
	tNIlo1YkrwnGKMD/8cbyYbl9mhWKMyOCmV9ac2AEXVOtHNg453rWJz9CoTFaorYhPCHVhVfWkQS
	Q25dN6SFXe+B32gw1T2LWjW2vYeF5Qe8KUAoe2jyCgEkSCdUX2fAobzKNpM+BYsVbEWQnyUvr4I
	GyNLN
X-Google-Smtp-Source: AGHT+IHy7AXxJJDzsDWie0QeRPdRL7g7CgsUCpA59V55wQzkBFyCEffrYZI1d0c7ntvg/j0t9yrGTw==
X-Received: by 2002:a05:6a21:8dc7:b0:1ee:450a:8259 with SMTP id adf61e73a8af0-20446024261mr3667887637.18.1745508756859;
        Thu, 24 Apr 2025 08:32:36 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1360610a12.43.2025.04.24.08.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:32:36 -0700 (PDT)
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
Subject: [kvmtool PATCH v2 06/10] riscv: Make system suspend time configurable
Date: Thu, 24 Apr 2025 21:01:55 +0530
Message-ID: <20250424153159.289441-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424153159.289441-1-apatel@ventanamicro.com>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083238_090129_083EADD5 
X-CRM114-Status: GOOD (  10.50  )
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

If the default of 5 seconds for a system suspend test is too long or
too short, then feel free to change it.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/include/kvm/kvm-config-arch.h | 4 ++++
 riscv/kvm-cpu.c                     | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 0553004..7e54d8a 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -5,6 +5,7 @@
 
 struct kvm_config_arch {
 	const char	*dump_dtb_filename;
+	u64		suspend_seconds;
 	u64		custom_mvendorid;
 	u64		custom_marchid;
 	u64		custom_mimpid;
@@ -16,6 +17,9 @@ struct kvm_config_arch {
 	pfx,								\
 	OPT_STRING('\0', "dump-dtb", &(cfg)->dump_dtb_filename,		\
 		   ".dtb file", "Dump generated .dtb to specified file"),\
+	OPT_U64('\0', "suspend-seconds",				\
+		&(cfg)->suspend_seconds,				\
+		"Number of seconds to suspend for system suspend (default is 5)"), \
 	OPT_U64('\0', "custom-mvendorid",				\
 		&(cfg)->custom_mvendorid,				\
 		"Show custom mvendorid to Guest VCPU"),			\
diff --git a/riscv/kvm-cpu.c b/riscv/kvm-cpu.c
index ad68b58..7a86d71 100644
--- a/riscv/kvm-cpu.c
+++ b/riscv/kvm-cpu.c
@@ -228,7 +228,7 @@ static bool kvm_cpu_riscv_sbi(struct kvm_cpu *vcpu)
 				break;
 			}
 
-			sleep(5);
+			sleep(vcpu->kvm->cfg.arch.suspend_seconds ? : 5);
 
 			break;
 		default:
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
