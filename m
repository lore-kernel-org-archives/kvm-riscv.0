Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FDECCD199
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqfLiSvAwZ2DwOPxnxL9+2qAKA/brSyO1Drns48LrS8=; b=eigY+r2GSybIM4
	GCyL2dcUak7iE8Ebqxs7uICVTq3M3QjKJ2WBSPNn6oFJJGwUACHtxnH/sQWfpXqN3LJSsETRSbr9z
	bjCmxQIhFPme5eMGeprbf8zOynPsp+kV42yxjq9te5Kqky4XslCtL6H7aQwqpm2zmcGh2b23qTeyP
	m2evclrC9+VqmV0VyH3lcKHRz5JA9VMNmfv3aaxXc+O4y6EzHOJ/NLXQBWqW9uSO3YV9HkrZT6Ugj
	TZvm3OuyivZd+HCIEDbUx/7brkKS+q3vqwRFvz4WieKXs9sFmzkuoMB3ju/+YcB9Wd/2AgxOSWJkN
	7Xt/i7wwHoeFOr+m39hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ms2-00000008LoM-1xTV;
	Fri, 17 Oct 2025 15:59:58 +0000
Received: from mail-pj1-f48.google.com ([209.85.216.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mrz-00000008Lmn-09Qa
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 15:59:56 +0000
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-33bb1701ca5so1675272a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760716794; x=1761321594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOxr4kUrx3o2qKQ3zJr2xwhR1Y/B5zgWnTBkv0V7+0s=;
        b=dxuJkuY4GXuhbcYe4T+WeEwZNKu/3u8gTBqdsSdzpMa1Ggd1s5kEi142eajohpSWeB
         UR13WWOCapUrF2sFYm9/bMK+M1bYLnWHmNQ3QqIqJVrf3Qa+3A1ZMqXEpsnBnFt/cAV1
         K82uWsdKCY38331zOCktSJkIfUFrBZeJfdrlHZN7Gyzut0KeVXWbtQxFhSlPQTPwXZqv
         LD3BnwPzOAE3XdDoE1pkiPzHLEQ/trUnttxIcMy4GrcNzZPNJlUYSmXvwizq/gomJrKc
         3oIwYwS6mhPPiYk9KjkSZGiBE1bW+PO9uDVFpiH7G/9jDYM2kxv8djwjajLtRSOkEjY4
         vteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760716794; x=1761321594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOxr4kUrx3o2qKQ3zJr2xwhR1Y/B5zgWnTBkv0V7+0s=;
        b=H7k8tf6qP/zNF56NmYEhz/MZWRvCQnw6E0YvS/Ou++eubnvFh0Q3gw3TCtL7BIeA8x
         g0wAbG7cOScwq+dgWr2m7IkmBTwWdADAj6pHlnncqRzwefLX3ZzQnD8YWSwYVKgC0/lX
         FKcHMwfr+6MZpBtEcK/pZrnSx02fwCsCr2Ycu8/+JEOIwI9ArWUH6Cij48uXMSzgeN+j
         xFs8Vm+Gp7KNrbUk9VGszJG3GD/+v1pzpiccMraSt/SQtLcSLBCB4ima0oYIPJr9kMjf
         FlJczqSYzCauldCOLDQBEhPpj1zSryfHt6CFNvEOQdEZqbH+u9HgdGjmNQN2m3d5NnYy
         0Hmw==
X-Forwarded-Encrypted: i=1; AJvYcCXIePXCKVaoFko5WMLTLXTBiWRrtrl4kwuUWE0i66x35P4JseeIJ8TNzEXmFHLyNJsRsjzLx1xmYVA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4mUVv1AleTU2wDoX52SyJ7Kk1dIuJb552fUOCK6urzUuHzVef
	G+qAp6/1j/YhsbfSDMJgNvaALR2z2LqqTgoGDIRSeH8AxKDNBehUkhkha5SC9DOhNZA=
X-Gm-Gg: ASbGncs7zg0Lt6qvbJJ1swLp3x9zgoayA2Yn4GFTF3XwjwAP3XnVxS8rFI7Tp8suSfX
	VwL8pDeI8vbIzG2SYhgUIAIxT/r72gI2JAj6j1tBpchhHV5U4WxgRBK7AXh/wliymouwiTRd6Xp
	vxH4REZdpM6PZhSB+TIiC48g7wORVQUmKge8s5X2qsRpXXckC8J0ZJlogpZfIljdO5/NijwcSHi
	3lDGV+XTCFcBTxWi5Ddw0H9CKaCJ5QhwFgARykQ6C2tFdf17o4fmN44KUsZzcMhDMu8AK4nLrxu
	NAW+Z1Vi04KR7W58yzYt39EqXtTbbQym2cBnsgI5s1ScsBiyARv1RR3XMJ0gGLDfEE/AsoEvQUr
	IoDBltp50ygPr2m+4OmJQG6LBbsqY4qJlA+9o+QIvt8HNcZc/dvCqwJByWm3tlQqKJ81tDgTnE7
	/Z0hBV0tmJ+7302ZVlxXCVdKJ4ut7gQ2jq
X-Google-Smtp-Source: AGHT+IFoCPBiPeGQQLQ+fG7ai4z/yEAOOUIjHcz+WvJaH5Mkp92XTCRypBxB5qA/CcWwuixBEctClg==
X-Received: by 2002:a17:90b:2690:b0:33b:a5d8:f1b8 with SMTP id 98e67ed59e1d1-33bcf86ce26mr4729546a91.15.1760716794026;
        Fri, 17 Oct 2025 08:59:54 -0700 (PDT)
Received: from localhost.localdomain ([122.171.18.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a7669392csm151067a12.18.2025.10.17.08.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:59:53 -0700 (PDT)
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
Subject: [PATCH 4/4] KVM: riscv: selftests: Add SBI MPXY extension to get-reg-list
Date: Fri, 17 Oct 2025 21:29:25 +0530
Message-ID: <20251017155925.361560-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017155925.361560-1-apatel@ventanamicro.com>
References: <20251017155925.361560-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_085955_075137_2B00BA08 
X-CRM114-Status: UNSURE (   8.09  )
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

The KVM RISC-V allows SBI MPXY extensions for Guest/VM so add
it to the get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 705ab3d7778b..cb54a56990a0 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -133,6 +133,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SUSP:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_STA:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_MPXY:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR:
 		return true;
@@ -639,6 +640,7 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SUSP),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_STA),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_FWFT),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_MPXY),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
 	};
@@ -1142,6 +1144,7 @@ KVM_SBI_EXT_SUBLIST_CONFIG(sta, STA);
 KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
 KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
+KVM_SBI_EXT_SIMPLE_CONFIG(mpxy, MPXY);
 KVM_SBI_EXT_SUBLIST_CONFIG(fwft, FWFT);
 
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
@@ -1222,6 +1225,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_pmu,
 	&config_sbi_dbcn,
 	&config_sbi_susp,
+	&config_sbi_mpxy,
 	&config_sbi_fwft,
 	&config_aia,
 	&config_fp_f,
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
