Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CCCC369D5
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVha9NidlBo5zCvEIfFE7pJC3pJP/24Wma1hhrSofTQ=; b=UgLZ/iYB3nAh8n
	2gDBIkyf2tsCZubDtuzw9mtLeBuTuSQFPF4L4c5wK0gNhEaQKuz6iHL9UF2elQe3pGbV2h+JOBEoI
	fibCtdzd46vwgVbulOg9pX+fISdxAUIu9Gfbpw88Xu3CPosQJFKypkCE0J4bBeiRCH0uQMdUP9JuB
	mnt3wFiDcY9xZg928eyq1wjyrqH2qp0RljMe/OdFUCNWfGI84/uPwD8+cq9+8U1QtZZKDjgxekCPS
	mN4tYXxVMWWIYd8AEcYBdjkm921mwoS1NOzia2KFtpJEMTEhcZuFKWavpdFnbnUclIFFGleE9RT+A
	2YCfQngh2jnZTGVkQjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKR-00000001tuq-1jzb;
	Sat, 26 Apr 2025 11:04:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKP-00000001ttn-20Hd
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 11:04:14 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22c336fcdaaso38031015ad.3
        for <kvm-riscv@lists.infradead.org>; Sat, 26 Apr 2025 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745665452; x=1746270252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0IwKIyhJe48lUgNI7YxfwAQ5b4aIzLCl3JBaAqKrgA=;
        b=MjzwNBGCbZUGkvk2OoF+Nk7/11bi9zZ4TZ2pLg/YjhyOiQamTeOL8s66pYsWXxszTq
         JNSmlOGggAytodq6/tbwh8Yi7tkABhBs/67V9u3ssneYHewMn2ccnQ7QLs1/4B2gat64
         MBpDBh+9mL2pO40l7DDPZDoQvvCWRAfOSzW7eaeA72sEX8NiD61mAc8yjGO9M0x+B4XD
         xrIMXyy//4eAtyyIJxbjRaZADvIzKD3l7cQ/x2q4vmX6XLL2Pdcr+Y7ZEt7ZSbqm2VlM
         f60dFe2QHbguswihyloXgFLMKV+v8n2FlwdexAMqfi2nKbeis+fDVWOOwTb7g48Ghcs9
         otUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745665452; x=1746270252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0IwKIyhJe48lUgNI7YxfwAQ5b4aIzLCl3JBaAqKrgA=;
        b=koAZQO7pKIIK3ZkyWYmnfsmqc6PhYixskBRWxUrjmNSg/MDr0ztKal/2+K0cNCfK4b
         cdvowkShE6/EfbmJ/6Y4waSFZX4tGHIqXrtAl/VBfqHd2D/g+EoB/9g/BC3nSU9ChChZ
         Fz7AZS3Sid3n9pnJN7EUioqkFbbvjJ92tdnH+v7rLFXjvZ0TwIai+IZg2GUXWvhqUaY8
         n+S6n2TRmgEtI9wDb74wphZmUDgPpHS86WBobCIKJjetjcT0p8Sez/Dykpq/VzlgEJ/1
         FFSEp/g9GRIXF2n+ZBYytmYn5oTZNtifN4y1qQ44I4usFPzcnELDcVMEBSg+LyC6fWAR
         A1Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXk3n6G+kRwOgE+ZhSJwfgutp4U2vpNIdlZEINFuXFo8O/HEqrC6pZ471LSBy2MMg2OBVoOuu8sziE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTvC/OmvPlKSA+S+LKOTGONzcv/pKyFYihajeitFESFsazDQW4
	u+PnTY87hklk9gKswxI4QqG8fJ9u9ZVJPAFz8l7Q86BH2XlnGHGCZjgb1I5Q6Fs=
X-Gm-Gg: ASbGnctKeE3Q1o8AQN9w/H4DCRL3vP9SLtjvhZSv0wXqotP2Pcpt3NddnqWQQTM8dNs
	YfxcpwCeeBeT2TUCvFQ0UeUCiaCPWw2HseIxU5cHjopbEX973OS6WcZLBc1NuuneFa3a6rHv3AU
	KYZhNQ/Y32mXUuNL+cHZU/3IRgIfxTyeRMAz/ONLhcv07cCZir4mulStGIBHDY873VCZ1jLs8ix
	Vj9esufmBlZNikSn7TjwjZYOSW5qAH+zS4yDO1L4/+zdSRmPIel0N5maYlrQ/oz36tjZ1qaqaAZ
	gFZbzuQCmbmV0ywn7wH9qEhbnxNqXLLry/8M/cZlzZRUxSs5b6TRQjDLzPZfmMRQ3b/xH2eSLi9
	2O0kh
X-Google-Smtp-Source: AGHT+IEUyP8Bw9liWUKDVyCN8lDpBvdIIKIvvwie76DgjSbiYPaJKKH7xy0oBU4DlxeVssDGygoABQ==
X-Received: by 2002:a17:902:f304:b0:224:10a2:cad9 with SMTP id d9443c01a7336-22dbf62c6d6mr71591435ad.41.1745665452494;
        Sat, 26 Apr 2025 04:04:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc8e24231sm10956725ad.125.2025.04.26.04.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:04:12 -0700 (PDT)
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
Subject: [kvmtool PATCH v3 03/10] riscv: Add Zabha extension support
Date: Sat, 26 Apr 2025 16:33:40 +0530
Message-ID: <20250426110348.338114-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426110348.338114-1-apatel@ventanamicro.com>
References: <20250426110348.338114-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_040413_513297_E26B051B 
X-CRM114-Status: UNSURE (   9.18  )
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
