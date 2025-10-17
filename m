Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E75CCD199
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXkTrgp0Kh5O5zJMHYLpgI5UXuxH4ZrEAAic71XqD/Q=; b=XH0GIzlYlC02WX
	T7ZBv67v15zxKGo+GN2sXjR3CRpJyQp293CnqoXvoC8EJn6RMplnvH5llEQw7tChkRK98tBZVF6on
	9/i28Ednk7he38ZZgUZYQZqfTHoHasaKAMf1gnhxhdFsnHcXo5z/SP1A4TJY5Uwpz3sWL7rTt8frx
	hQQXE3lVJwuiB8GiJZBuCa8zAWy+/YO4hvjkLww6p02dYBZ66yq4JMitw5u4Xug5ZsuqK8+yu3quo
	yiFsFk8J/MkL0Fz2FJGNeN18SHiBTO7deQYlFQIfPbYS8n3qZyrCsLaajGPKV3PjKqVNwM7N5ZTKM
	LU5eDBrv3GCMLBPe8zqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mro-00000008Lh6-3X8W;
	Fri, 17 Oct 2025 15:59:44 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mrl-00000008Lej-3maJ
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 15:59:43 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7811a02316bso1518979b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 08:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760716781; x=1761321581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w5xDGLO7hW3hS92oDJ9fb7AKUAHlmH+03Jt/Z8OfK8=;
        b=QV8Af3fn5a1nejJmJ/gfb/Uaav/9EB1MKtIRnjn1c2mBmgwfQkcqd75tfgiMhPAlgA
         LtPf4i+fM2tjcJOKX5uTvuASD20fzC2ARZTKqDXml9pr3hl7K4p89jsEBXETYJYBGEKN
         BP1X6rUGd8N8AXpK0cekq5phEUkfr6f/5AhERK3WS5SenHhOljQW7oHxG02RjLgC1nfZ
         7s8m7vYc1SF4x1TQlaTvL9oAAcLF3+BglSGEnco8ZLi5+0dGQIb05K4szIJgIhSQsgrU
         IiR+oKSa0taiC1D8kTcvpPNWCtQS8t9tXsUStpVAJN2CwVL7pXvclSrj5BEFUEsOtDiQ
         di0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760716781; x=1761321581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8w5xDGLO7hW3hS92oDJ9fb7AKUAHlmH+03Jt/Z8OfK8=;
        b=rmn2qrDWDo6dWr7Acaf8YjG6Hoka5H0e9ulCieyXBg6C4REbLhuKuvuUh8EDwoDo/y
         RLI1ptokd77WZQ62aRO8rJf0Zi3rKFubcaYmCLE0sgcu+hc9jx1/09Ps2hYQtFwMIwu1
         XCw2YYRX31F2y4UwhqzU+u86/K16K08ABGk5D5vL5gZfzoCxNHui8UaPRFtckDLw5HoH
         Gz4iyh3eVgzrnZXFz2O9DZvdYVYRq1r4FNABgcM7koBocO2GMddKux2mwVb0xfIA9gOb
         qg10dypjUTUneNitbVR62DhFYKWg5vXhcW/i9UcIRBuMU/32yJVqmYNQ/bLi5yL31Ad/
         fwcA==
X-Forwarded-Encrypted: i=1; AJvYcCVWh6Es5r7bYQouxxVpp9BD+tV7ZnpTx8P9QugeGCSbZQSY8+CQq0RdFzB47RAcoV8suTocmnaAvmk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwtsyIKpFX/749nwVCl3ZcbpF87IdSWTgekMVBpTWgdzQBNjx1Q
	BTgQBAWuL7LuQH4yPOHWTg6GuciZqEQD2pNBQ9oAXvMKVUJ5CVQ39Nei44PK4F977Wo=
X-Gm-Gg: ASbGnctA20iUkEJVC5x04sgRoUUnB9oAqXhJmilLzexar0bcf3XG1/Gl69KBrLrf0qX
	zZMn2xg0qLW/xKsTRs0soUP4DM1C7zOQO7vFwI4IwOziVNgIsstom/YSMtN6wz0YToTNCasGOhL
	7ICaC5+nQZaKLtEV1SAUcu47DRrG2lcb8IgEy23ha3xMS2DYSHjmL8WHtxlccj5oHBejwjkjVrJ
	8R7k34ejDWCqaY8ClixEsyixTkZ1DLKQzDe7zSvsh8aVxw5huLFuIFBFjIxihvlSdCZ4i5qi7O2
	VNta10Lmq9wDyVMSRxI27QKwZGHjIx49Wy6R8auELLTs88PHrugei49UQOLZrUyR6JDoPQ/rjRt
	Orl+qY/N7WUwgW0ynobKoOB03epY1/y7pfh9Nfy6hj86iy4mBSko1lk60ffxGsYaIqIVpojagDY
	aLPKyeW0Q1dHzvhsf95ed4LOQp4hgV8WHf
X-Google-Smtp-Source: AGHT+IHNbVvYJz+rYfwfI4m+3NraggPiuTL6qpx95XEifxO4NBe/kLmHp3qJst7WcfaiUNvQG99/Qw==
X-Received: by 2002:a05:6a21:71c7:b0:334:b734:eed2 with SMTP id adf61e73a8af0-334b734eeedmr685727637.42.1760716780898;
        Fri, 17 Oct 2025 08:59:40 -0700 (PDT)
Received: from localhost.localdomain ([122.171.18.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a7669392csm151067a12.18.2025.10.17.08.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:59:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/4] RISC-V: KVM: Convert kvm_riscv_vcpu_sbi_forward() into extension handler
Date: Fri, 17 Oct 2025 21:29:22 +0530
Message-ID: <20251017155925.361560-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017155925.361560-1-apatel@ventanamicro.com>
References: <20251017155925.361560-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_085941_949887_9B2FB8AC 
X-CRM114-Status: GOOD (  14.50  )
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

All uses of kvm_riscv_vcpu_sbi_forward() also updates retdata->uexit so
to further reduce code duplication move retdata->uexit assignment to
kvm_riscv_vcpu_sbi_forward() and convert it into SBI extension handler.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 +++-
 arch/riscv/kvm/vcpu_sbi.c             |  6 +++++-
 arch/riscv/kvm/vcpu_sbi_base.c        | 20 +++-----------------
 arch/riscv/kvm/vcpu_sbi_replace.c     | 27 +--------------------------
 arch/riscv/kvm/vcpu_sbi_system.c      |  4 +---
 arch/riscv/kvm/vcpu_sbi_v01.c         |  3 +--
 6 files changed, 14 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 3497489e04db..446f4a8eb3cd 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -69,7 +69,9 @@ struct kvm_vcpu_sbi_extension {
 			     unsigned long reg_size, const void *reg_val);
 };
 
-void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
+int kvm_riscv_vcpu_sbi_forward_handler(struct kvm_vcpu *vcpu,
+				       struct kvm_run *run,
+				       struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
 				     struct kvm_run *run,
 				     u32 type, u64 flags);
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 1b13623380e1..fd4106c276d8 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -120,7 +120,9 @@ static bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx)
 	return sext && scontext->ext_status[sext->ext_idx] != KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
 }
 
-void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
+int kvm_riscv_vcpu_sbi_forward_handler(struct kvm_vcpu *vcpu,
+				       struct kvm_run *run,
+				       struct kvm_vcpu_sbi_return *retdata)
 {
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 
@@ -137,6 +139,8 @@ void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	run->riscv_sbi.args[5] = cp->a5;
 	run->riscv_sbi.ret[0] = SBI_ERR_NOT_SUPPORTED;
 	run->riscv_sbi.ret[1] = 0;
+	retdata->uexit = true;
+	return 0;
 }
 
 void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 5bc570b984f4..ca489f2dfbdf 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -41,8 +41,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			 * For experimental/vendor extensions
 			 * forward it to the userspace
 			 */
-			kvm_riscv_vcpu_sbi_forward(vcpu, run);
-			retdata->uexit = true;
+			return kvm_riscv_vcpu_sbi_forward_handler(vcpu, run, retdata);
 		} else {
 			sbi_ext = kvm_vcpu_sbi_find_ext(vcpu, cp->a0);
 			*out_val = sbi_ext && sbi_ext->probe ?
@@ -72,27 +71,14 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
 	.handler = kvm_sbi_ext_base_handler,
 };
 
-static int kvm_sbi_ext_forward_handler(struct kvm_vcpu *vcpu,
-				       struct kvm_run *run,
-				       struct kvm_vcpu_sbi_return *retdata)
-{
-	/*
-	 * Both SBI experimental and vendor extensions are
-	 * unconditionally forwarded to userspace.
-	 */
-	kvm_riscv_vcpu_sbi_forward(vcpu, run);
-	retdata->uexit = true;
-	return 0;
-}
-
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental = {
 	.extid_start = SBI_EXT_EXPERIMENTAL_START,
 	.extid_end = SBI_EXT_EXPERIMENTAL_END,
-	.handler = kvm_sbi_ext_forward_handler,
+	.handler = kvm_riscv_vcpu_sbi_forward_handler,
 };
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor = {
 	.extid_start = SBI_EXT_VENDOR_START,
 	.extid_end = SBI_EXT_VENDOR_END,
-	.handler = kvm_sbi_ext_forward_handler,
+	.handler = kvm_riscv_vcpu_sbi_forward_handler,
 };
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index b490ed1428a6..2c456e26f6ca 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -186,34 +186,9 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
 	.handler = kvm_sbi_ext_srst_handler,
 };
 
-static int kvm_sbi_ext_dbcn_handler(struct kvm_vcpu *vcpu,
-				    struct kvm_run *run,
-				    struct kvm_vcpu_sbi_return *retdata)
-{
-	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
-	unsigned long funcid = cp->a6;
-
-	switch (funcid) {
-	case SBI_EXT_DBCN_CONSOLE_WRITE:
-	case SBI_EXT_DBCN_CONSOLE_READ:
-	case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
-		/*
-		 * The SBI debug console functions are unconditionally
-		 * forwarded to the userspace.
-		 */
-		kvm_riscv_vcpu_sbi_forward(vcpu, run);
-		retdata->uexit = true;
-		break;
-	default:
-		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
-	}
-
-	return 0;
-}
-
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn = {
 	.extid_start = SBI_EXT_DBCN,
 	.extid_end = SBI_EXT_DBCN,
 	.default_disabled = true,
-	.handler = kvm_sbi_ext_dbcn_handler,
+	.handler = kvm_riscv_vcpu_sbi_forward_handler,
 };
diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
index 359be90b0fc5..c6f7e609ac79 100644
--- a/arch/riscv/kvm/vcpu_sbi_system.c
+++ b/arch/riscv/kvm/vcpu_sbi_system.c
@@ -47,9 +47,7 @@ static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		kvm_riscv_vcpu_sbi_request_reset(vcpu, cp->a1, cp->a2);
 
 		/* userspace provides the suspend implementation */
-		kvm_riscv_vcpu_sbi_forward(vcpu, run);
-		retdata->uexit = true;
-		break;
+		return kvm_riscv_vcpu_sbi_forward_handler(vcpu, run, retdata);
 	default:
 		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 		break;
diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index 368dfddd23d9..188d5ea5b3b8 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -32,8 +32,7 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		 * The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
 		 * handled in kernel so we forward these to user-space
 		 */
-		kvm_riscv_vcpu_sbi_forward(vcpu, run);
-		retdata->uexit = true;
+		ret = kvm_riscv_vcpu_sbi_forward_handler(vcpu, run, retdata);
 		break;
 	case SBI_EXT_0_1_SET_TIMER:
 #if __riscv_xlen == 32
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
