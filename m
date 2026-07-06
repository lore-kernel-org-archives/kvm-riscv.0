Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63293C43458
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VwQn+1EddDS7fcE79STWritI8bFTxMeJ2e2kKkYRoA=; b=sobvhW8Wrt0Hx8
	EsomMj4+Tz1zpAB+3dI/Fc/qKET6oN5BRcOMcgKHOwSMOeRl0DT3n9G2qJv5NeT5VIzLNlFf0hzuq
	imEB1fyYP6ihsgujBJlC2V6bBUACNErjkeBaqV9ftHJiveQ9A5n8Xe9ak07tRznjtK5G2zr2q/M2c
	33aEWqGGCZ3ydvCuMOO4Vw5KETJVwgPkABm9Nac7/5PTeQfHyt///xt3FwXkP+AhczONewkR5ZCj3
	xwGriCms8ILn5030z2QtZPNvRbmdM0leoXjAUOg8ORRy3/bxWrOucPMAoDxnZkNdF7j4miVv2lGV0
	I5UrfJJM/FNU+JCGAGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxz-0000000BNcz-0cT9;
	Mon, 06 Jul 2026 02:21:51 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxv-0000000BNYB-3Cg8
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:21:49 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3811e59df58so1372496a91.1
        for <kvm-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304507; x=1783909307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=XWPo7XrM4fDrtlIabHNfLfFymRP5unU7czORVYvcYrBpMNQ35QHIEmbefAJfS7OxJk
         7VBxb08xjt+OXZX1omAqq8Tz4Xf94JJ+lMM/gVTn6+2waS23ed39JP2g6B/buc63uk6/
         uN+Q8ih4wdYDKQSFtGcV56scr5Sqq+67YyBcAWF/BvfMbnc0nHvkuDJ680sqJtDmVA9h
         xEEF/56sVoLiWDGKUAP6IXidly6tEFzNQ3X0Ucf9BCJZQeAYToeOwC5nGDlFpI9ZMAA2
         2renkAwK4Ruv10MzYYpHVguY58plJTLG3N1PHJfiqg0+G0lhJT1VHRGe9iEXtDdygjI4
         9kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304507; x=1783909307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=Vz/QKctqE0VULrl9zJ36BiWyMtVZ7J/WNBeSf7frqn25s9S6+NeBBAt8tlW5drReU+
         GJ9jADN76o2W1O7GD+2KTLsjOZ6ukgzJL97n3W65pQlwVH9dr6JRJUEXL9UDCICQmRuS
         K712iWPSc8WAd//xHYSs7tdPckka8HqrFLRvxqGHRp5YDHuMV1Z5477MxhEQTzhYFoDA
         S/qpf80a+PnvyU8vPCE3UELtFzfl3SKn+anFPbmytb0DbmkaG4C29/I8ff6jZuO8TcR4
         RqZWMe9k6ZM3grBSVsq3D3fvW1E6qVbIojXLp3hvetslsa5spKF2xL1Sr2qBkN9N6INR
         Yucg==
X-Forwarded-Encrypted: i=1; AHgh+Rqgw69NaYGr1fM2vv7KE11EgDvVqXSURVYzcRKUJaxkEzyolAAY2WtJXyjprLnq6QJPxf/D3ybfNpk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAPzVta5krBC+0UGw3KoGnjV3z6Fmk2uYTg6tFeE+Y5CHZsju5
	t4sK/JTOVmdnwSZX8/wZcrLKCI2e8IqGbSpqVHkfxz2cDYwm5FiQTxax
X-Gm-Gg: AfdE7ck+R56k6xGKEeI/zRgu4XcqtalnUGVHmEftXZhyjDha5fPMc5rJjoP0vDJXANN
	y7/D8sPEwaUSIBwmzFmuJJBWFIarTdshQLMmNMbv73R5tmV4b1wY7vKhX0lLhNIUmR0tDKnWTYu
	LIvXIRj6OYKZCJ/IaOJlPgWvr/1kTblzRVB/egpLsp7CrfB8xZwlb0YalxM2epG03QMwpxZmwnM
	qyS4XIGGS0RfMwAkPWSpXRgN5Yba13Vpa+9/Fn18GIJtxfkfuaPbe3iR+6Ei5MPIZw4v/i5732f
	ZaQmjSWh1HxuJPcyt25dUI3apmnKoYTDXs2IR9s6dmB6/5hFDdzw9WeweZDTZ4olftChEl+7aEl
	Fm/iuGwtdOYzA5VIVLS+aoQ7Jd70ANcG75+8Gk6BDZL5Jm7+URC6J0ZU+HznxIcIP
X-Received: by 2002:a17:90b:288c:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-3829f00021fmr7476641a91.23.1783304506913;
        Sun, 05 Jul 2026 19:21:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3854f03f92dsm1348394a91.6.2026.07.05.19.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 6/8] RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is enabled.
Date: Mon,  6 Jul 2026 10:20:42 +0800
Message-ID: <20260706022046.214956-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_192147_821646_CBDE9E94 
X-CRM114-Status: UNSURE (   8.59  )
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

Delegate the newly added SPELP bit from Zicfilp extension to VS/VU mode
if it enables landing pad support.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_exit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 12eebeabdf14..92a3ea7c7ffb 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -154,6 +154,13 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	/* Clear Guest SSTATUS.SIE bit */
 	vsstatus &= ~SR_SIE;
 
+	/* Change Guest SSTATUS.SPELP bit */
+	if (vcpu->arch.cfg.henvcfg & ENVCFG_LPE) {
+		vsstatus &= ~SR_SPELP;
+		vsstatus |= vcpu->arch.guest_context.sstatus & SR_SPELP;
+		vcpu->arch.guest_context.sstatus &= ~SR_SPELP;
+	}
+
 	/* Update Guest SSTATUS */
 	ncsr_write(CSR_VSSTATUS, vsstatus);
 
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
