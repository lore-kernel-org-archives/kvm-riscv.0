Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAF2C43602
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 02:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmmvRUE6gi+35DV1HjmrdvSkFgzplHQ56zCgIbtGR4g=; b=W18zpNF9SlvIpx
	aVdLy3BP+hE96JjPqPDl5kEDHo3ZRFCb+0APvr15tJ3TI1j/LWTwEagbDWUhFOmJtyLakp5RwJlUI
	6yisgCZp4qoL27V3bYzIjG3pkKlm/jHZHPI3Hzb1uI/P8VEezbBt/g5xhdOmhSTa+qEzhZJLMMehW
	Ky1xtV1STU+CIrXYgZ9puzOhah997WIFnjqnJdWZKGSVsb3/TomqrAYTgr0oO6PZkhpGsxEohR+3m
	Ua4pOeBHZ54t3PoZ8/GRZsV23/8EQOzNXVPj2ClwOoI35ZYrHGYU5GwNDY3i+Zk3RYF2GKTmPAW8R
	2OPOAs3gN8txIQYPHzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNQ-00000000UxD-0ZXb;
	Wed, 01 Jul 2026 02:08:36 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNI-00000000Uof-3F48
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:30 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso125619b3a.2
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 19:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871708; x=1783476508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=mvuIYisp9VURLdyHXiaUIOXFm7qVHZ3TR8z+kZ/LxM0Zfa0u38u2ABdVcmcQLudUfO
         k4tj4oLbypeHigi136fZP5LQ83Ehx2MxvH5xAvJwYYf5ZLCfSyGdZKLA4zguubncTBpv
         O91NweQBSw1vEfQr8mxsSNf52JhPzWT+XZTBcppBwUvBmP4KCcnvrWCxrZrbVr+3EXBf
         tpOXC10mDpLaxl9L9iG5vVPO9VqgCQ1cFUPrMxkS57qeKlzPmeAWqXcxYApmQSm54DTd
         SlCL1npHTqsMP9Y9gtfDdZvc3HYhJuyTZZWO4zfmrvJtGZrLnhN3WKXoPPUcpg8V0Lue
         a+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871708; x=1783476508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=pYO1S85qnniL5DRAz+xNlPiU8AKQ1X0ujX/nq76qoiVHB+fvWHRxLKcRjj6L1mFaHy
         IPRUXtfhFnzDDQVVFJSyZd8j5FV3ya9/r/LNiEQk0kVeXYFeTW96H8so6vNcWVjHKf/N
         2BNp9qHJBz5ryFeLakSQ/YS5po+Y1iMUfscOL3PBU+z1vyn5YT6cGVgmEQkCjLeEf9u6
         eygauyZCxSMCHLF3afjIL8D5yLrazqbWbEwAIsQw0biUVQ/KQonYi/eI/yo3Zqn7pCuw
         ZvCuX1HwJleQfCI2VZKSWnBM+UsoD34IMMTVYDjXDu+IHd64gbEjvgN8Mobp+8Utb7xd
         dGjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLlbbALl3w2vvWpLEsbhHy/Z32px5lSkNRxGn+kFDjhuFJ7Z7hzKUiBMGXqO3ZDsghuI9ZUyEsJxg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqme9EvO3E5LSZMpi7yYoysxM3LFzcMbXhT9Mz98GbzB1AqiLE
	rPyGZVDYMtZdDSDoqMDQunWK4YFF9ko/VMCAdKKOby6nOEdcxPLJ51ck
X-Gm-Gg: AfdE7clBI6RZ2zvUK7cCtBhnqLE8kOjaNyN86ksn9Uu8lrlEAoNrbCzzCqMwa6B+ABX
	fv88NwggXcXE/TG5aCMqbFVQf4LSJnkn/DjJDp1IFRU1JTNXPVKuivQu4X7b90g7duieXBFurwb
	C+27ayrfUSJDkhc4q3AOF46+xQBIUDR0aAO4aDv+jUobRgOn/XGDZpnaMQP7xf0MY9YZWhrJFxj
	KIDpw4Y8CkNDMcFg5dDaCd7HqJaZ8VqrPUTPwafEKEwZ75v7NGkNp+jNFdnxsnOXSjbV4mubhCH
	4CnONrqSulbHqjpRzzrmFZXX9JRm42G+MNAjpkg+ZdT9rWYOKz1MBHYi2Z3S3GUB6nI3VVdF1HA
	UoSdq/ta+bQAqFSyclJ2nD4HcqIIBpybeHINXzUqxk55lAJPMrPZSLqilpj11cl5bIeo3kO4qHw
	L8kh75iKz+Ftw=
X-Received: by 2002:a05:6a00:988:b0:845:e44c:2e5 with SMTP id d2e1a72fcca58-847addb218amr2835089b3a.22.1782871708161;
        Tue, 30 Jun 2026 19:08:28 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm2957918b3a.33.2026.06.30.19.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:27 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v4 5/8] RISC-V: KVM: Handle software-check exits for VCPU
Date: Wed,  1 Jul 2026 10:07:42 +0800
Message-ID: <20260701020746.170157-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190828_996519_9B5FC556 
X-CRM114-Status: UNSURE (   9.79  )
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

The extension Zicfiss/Zicfilp introduces a software-check exception
to the privilege architecture. Delegate this exception to VS mode
when vCPU enable Zicfiss/Zicfilp so the CFI violations in VU/VS could
be reported.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/csr.h | 1 +
 arch/riscv/kvm/vcpu_exit.c   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 31b8988f4488..224af9facf1f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -117,6 +117,7 @@
 #define EXC_INST_PAGE_FAULT	12
 #define EXC_LOAD_PAGE_FAULT	13
 #define EXC_STORE_PAGE_FAULT	15
+#define EXC_SOFTWARE_CHECK		18
 #define EXC_INST_GUEST_PAGE_FAULT	20
 #define EXC_LOAD_GUEST_PAGE_FAULT	21
 #define EXC_VIRTUAL_INST_FAULT		22
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..12eebeabdf14 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -243,6 +243,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		run->exit_reason = KVM_EXIT_DEBUG;
 		ret = 0;
 		break;
+	case EXC_SOFTWARE_CHECK:
+		if (vcpu->arch.cfg.henvcfg & (ENVCFG_LPE | ENVCFG_SSE))
+			ret = vcpu_redirect(vcpu, trap);
+		break;
 	default:
 		break;
 	}
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
