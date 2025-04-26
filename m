Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F31C369D5
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 11:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13GHTB6fsPx2cTLNb0a4NSQ86lfgcaJuHbYfGR3rBFc=; b=36hGb/C0gg3ZjH
	gZpt9/A7HHdT6JEx9cc59DbwrOmJcLvl5oxkH5ZxydZMl+J1xPMpe3tJcIxJHV8+J5BqCwxXPJ5uj
	CjsAmfTUVCq0cHpJYgNfsHwGUTekIOuE/zKgRhBpjyDyakK4az+dNb2NFTQPaGLJjGMEceOroZj8f
	/g2HtQwBrN0IiY8/lj65peVqH/74GO1Ic6sz6THtFnJ5d53ZhOWG8QHwE2H15DS8krLrq1AkVxe1l
	MhYBcBU4DIs/Os1pAcc2Tjz2yiRRCfaEbuuooKFBuDiPOVfIUrPzHvx5Qd7kKXA4I2Q4aBm1oqvqQ
	NwO858U5urf4x8Q7cv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKN-00000001ttA-3lFI;
	Sat, 26 Apr 2025 11:04:11 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKK-00000001trT-3nGP
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 11:04:10 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22423adf751so34433055ad.2
        for <kvm-riscv@lists.infradead.org>; Sat, 26 Apr 2025 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745665448; x=1746270248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq4t7UW6LQy8HVZqyavJ2lszswgStVhP6cQHkrVx0B4=;
        b=N21wYWWpi4YoTwrIJY9K/mOesYqN9ruYqIMg7ajmCEwFW1ZoB2VR92OxNrNMYFsiLu
         cGDOGqYfOdwDk9FAaEQePbGJZ69L6sqMVSKRIsnJi8OMKsxSqOTEfu4tOGlkNj/meGDv
         g95G0pICwhdFAOQd5Fu8Xin/u3WP+pK0Xw14oaOYtFQQ4q5PKGUiLsr5dcVjzDKa1tj5
         6uk+E0q7CZm3uV3hZ9uTFQtsGBccsXchOLid5yj6QEAxVR2LKIu4LYUolIK/ZABMwVFx
         lFFVUVwygzXUAgl6caAA/Zh3254DUFr+1U5HOlsLd3BdlAWTdI/8Q/OYrt8zEDZSejx1
         7DJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745665448; x=1746270248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq4t7UW6LQy8HVZqyavJ2lszswgStVhP6cQHkrVx0B4=;
        b=eQt0QAEYV9jxUfFyC8ifknqKC+6JeK+6oh2N4Hn1qR6sSB57HNBmSXeDYmuGaRFHAf
         5bnzUJPfwrifiXA28BVD3G7aoSmnKwQBcjdfci4/1Xbyx3jxHYliyI1Sv1jOMvID/tSB
         9oUj68E7dbuif7cIfJSIH6vZHxUIfn3KAlSUsp1S0kL9cabVewhP1+qH72z8NjejgDD8
         ue/jvGWaEf/KQHL0oVesK5hcUEypQEhRTIHkILrA+JMMp9xPVBA1z+rD3xRN526QQ8Du
         /GqlheT/Avq7yngLBrZP4yQ1i7FkxQH9tNYw3nu5fa6wpCiiVMiwVifDXUsBfngMzEVo
         lGwA==
X-Forwarded-Encrypted: i=1; AJvYcCUsZiME42HCarmZfYWYOwxJPr7m/FGBtpH6KmF9gIRSUQCQB6TJXHifDk/ywIwLxjqwGlnKk0Ml44M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzK9VXL49L0IsEY5ugtZ3OXeLIQ3jjnn5FYMpvcCat8pp7d3xSn
	M9LVUCO4pcN6xaaJZMDQUbhxMwHpy631TbLN6ma9alHeL4f0eJlX9ITHZd8LcNo=
X-Gm-Gg: ASbGncsY84ghH8lYmWIIdJmasifFlIJIjJuOrqS2yNBOGLnpUTBmI4IxhdCgdOcCCj2
	gtaCdNm3tfjyjW5AYZmuN694irmZ7vbH57pjxo3fSRToUSpidqVdU3/GQ70b6Iddlj7Mv0k4M0e
	9IaNbWj+GN97hFOSjL/rKChlZ7ZiQqN4cuA+xWfW2QwIPEyqhiQscbszIubRxyZgmcLLKEkQt5Z
	+xXs4n0cqqvKDSztbCxeakD33louU377kt6DXi0TrAQ61BB0Bx3/R+X4rr9owaAjxoRBuroDY4R
	lzvIRBvb1M/tmm27eA/ZgoB2l/iDdOy+6UEWKgcxzCN54VhnjuQCiACIL5yUsMSyZhtpvYh4CmL
	6gswz
X-Google-Smtp-Source: AGHT+IGDnh0quYRpDy7nLE2ncCbxfljnWL5zLXiKBflQXpcBpFJnbx3+2K5rT8sdaHoyn3k+2zKXrw==
X-Received: by 2002:a17:902:cf11:b0:229:1717:8826 with SMTP id d9443c01a7336-22dbf5fd209mr87029915ad.28.1745665447909;
        Sat, 26 Apr 2025 04:04:07 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc8e24231sm10956725ad.125.2025.04.26.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:04:07 -0700 (PDT)
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
Subject: [kvmtool PATCH v3 02/10] riscv: Add Svvptc extension support
Date: Sat, 26 Apr 2025 16:33:39 +0530
Message-ID: <20250426110348.338114-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426110348.338114-1-apatel@ventanamicro.com>
References: <20250426110348.338114-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_040408_938793_5CE46205 
X-CRM114-Status: UNSURE (   8.97  )
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

When the Svvptc extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 03113cc..c1e688d 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -27,6 +27,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
 	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
+	{"svvptc", KVM_RISCV_ISA_EXT_SVVPTC},
 	{"zacas", KVM_RISCV_ISA_EXT_ZACAS},
 	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS},
 	{"zba", KVM_RISCV_ISA_EXT_ZBA},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index e56610b..ae01e14 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -58,6 +58,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-svpbmt",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVPBMT],	\
 		    "Disable Svpbmt Extension"),			\
+	OPT_BOOLEAN('\0', "disable-svvptc",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVVPTC],	\
+		    "Disable Svvptc Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zacas",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZACAS],	\
 		    "Disable Zacas Extension"),				\
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
