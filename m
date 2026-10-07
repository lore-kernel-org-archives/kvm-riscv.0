Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DB1CA5FF1
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLlyfvwaUNRfh8ZS5zqV2/HWPd3pCfpc24aD464inSw=; b=MNh+grHHi9ULXi
	tBR+i+FykzLUJC/qg0XVOptSMV1OtArFYeDxSfAjTruzG6/xdVHKZtcuTEGgv7H5MpEWZ7WI4oFOD
	oKAFrzyg8HE115gRDNoR2FPS1/tEKZPW9Qcgt/455QTVpMKUKrR9gTeAnxRYyOaQFLkoCG/XQhr+X
	HuWpFk8DYFTLDmRh35S5EcsZUy/Dc+1ZvxjVgStj4eQJLFOuyHB05VFvvkelXRBXHFJN4NG46uOOH
	zDHo0wp0Y5jrZN9V0Zkq1Oe6DRpsZ9Qgio2ZhS7hhQul5NNY232TsfwzdOMmqhquv8WFLWp+KG7BL
	iKH9rMpDll3ndVR8a/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENNA-00000001zP4-0q14;
	Wed, 07 Oct 2026 08:51:36 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN6-00000001zM9-1g2i
	for kvm-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 08:51:35 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-14129667240so1421017c88.1
        for <kvm-riscv@lists.infradead.org>; Wed, 07 Oct 2026 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791363091; x=1791967891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/sQhRikHvQy+tFDRD+cXFmdlH5Y2NFpBNiPzBCd5xQ=;
        b=PItIHbrK1Ig0eqjhwzNGPZjkQ13YfZuA9TsJKz213WBesNiE0iFM1YmToSUdNom7ev
         1HdDJhsIrQUKbKFk9xnsIBvRS/z3khPteUb3oRjdAfDz9OEimQcd0z0R2Q2cLxBURiWV
         uiZd4Dkq9KmLxtTUepD0Opq2UkFhN5dCXqb+Q2HM0FpxYup0oCeQFGl+QT4yDO43l1q/
         eVuQWKKxpz6D5MuioZxP4pxo9FIg8dX1jS+z/H14JQH6PL0eBmcVD0ygq8FoqE09Wnzs
         2RF7Lzrum8OlsvkU46tEFuINAH09SFKFUvQrpdHbeh4OUKTk/YlyUgCpMA9Y35Cx8HAU
         ujLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363091; x=1791967891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e/sQhRikHvQy+tFDRD+cXFmdlH5Y2NFpBNiPzBCd5xQ=;
        b=btBjqizM5EAaGSpLUEu97FtWacBQJmA6XD/MtZUbWuOndsoI5t8RBVwFXXViF4zgQ0
         QzzwAS21RjLyWR8YvQlxEZU9BE3K1Cj0r5EyfRTtcsHyjW2p+c94UkpEDoSLVhfVdheO
         /7hwu/A6I4SWinRqmA2UYSkTdD3jbQZNoQDzaWYp5ZZalquW0KOrMZ8ZJZmtwriVIDeu
         D5oCRj4iDshg6LPm00rAWBff7lPl298h9YGNBgo+Bd/hIRfGSFcrdYfGKJ9omz4oKfTT
         xXzZJsFlu+mZLayJboa5RpU6sdMo+HXoPaxGgFIXTxKMlK7a+jDHXvyWMHfbLR4E/Oiz
         3Xeg==
X-Forwarded-Encrypted: i=1; AKwUvBw3rFBtJemRLQq8JG9xvzonEgdnFubGE4OEHY4w4lOkys9vOUI64F6+V7u/RQF1FstbU3BFNOytfIg=@lists.infradead.org
X-Gm-Message-State: AFuF++mFHEMKb/NeYANY31uIxYLSO9g4JbJoRG2e1yP/KKrKS040alrS
	nu0zqkOqH6h9V2QYBKvklvvB37vUBdxe/S5V71ATCvZiawYn8nUFIkRhsZawwPlHhG8=
X-Gm-Gg: AYBFou2PR4JLN/usBuSlH+rsTfLm8u+O3pzFQXQMFNd6xBesCg2y9aquqE3A2n9LkZn
	sqV4N1s+NepCbKSDfNN7sLLcOHEVxc9XXz3OipSdrsRHvN3k0FkSkPFMIeVilwCVSq79jgz1Jvz
	gt+O1wobe7Rr9Y82GriWDcD35K4ll1kb3wvkPOWUld+8cz0VfasusNAJTk963KSsK+E5e2zbXBc
	2NjIqDEdV5H6+b7vLp4PUhEpFfh6GufXWieMHDSmzSD+f4Ajte/unH+RTFjKVk4ZCzvbOpQ5lz9
	SjmdiNSxCSO2SkoUzABd2VHdpiy+aavo46regqDcul4dzSQUmuWQeEGcLrhi7L/bcSzEe2L76Dq
	x5k73w+uPVmN74qNzBa/ZrIRqTHNJtxvltViEXAJ0h/sRto+xSLFkXWiqcwjTIXzDgUp6yU13Uc
	1uW0gHLO9kZbTyUj5MNHw5Sm+uqyFo1AyxqLy00JgBFxnjD1KGhaMt9hfqd8vNY+aPljQdRFDaV
	EqaIF6kDCC8LzhGMAa0
X-Received: by 2002:a05:701b:2719:b0:14e:8ae9:87c8 with SMTP id a92af1059eb24-161fe497e3cmr1456351c88.1.1791363091401;
        Wed, 07 Oct 2026 01:51:31 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm396251c88.7.2026.10.07.01.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:51:31 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/3] RISC-V: KVM: Decouple vector prctl state from VM ISA
Date: Wed,  7 Oct 2026 01:51:18 -0700
Message-ID: <20261007085126.222688-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261007085126.222688-1-samuel.holland@sifive.com>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015132_437893_B879A89D 
X-CRM114-Status: UNSURE (   9.00  )
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

The ability to prevent userspace from executing vector instructions was
provided as a escape hatch for software that was broken by adding vector
state to the signal context. This was hooked up to KVM so a process that
could not use V in userspace also could not create a KVM VM with V in
the ISA.

Remove this connection as it does not really help with any compatibility
concerns. A VMM that does not understand V will not include it in the
virtual machine's ISA.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kvm/isa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 971f44655100a..447c778bf850e 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -9,7 +9,6 @@
 #include <linux/nospec.h>
 #include <linux/pgtable.h>
 #include <asm/kvm_isa.h>
-#include <asm/vector.h>
 
 #define KVM_ISA_EXT_ARR(ext)		\
 [KVM_RISCV_ISA_EXT_##ext] = RISCV_ISA_EXT_##ext
@@ -159,8 +158,6 @@ bool kvm_riscv_isa_enable_allowed(unsigned long ext)
 		 * Guest OS can use Svadu only when host OS enable Svadu.
 		 */
 		return arch_has_hw_pte_young();
-	case KVM_RISCV_ISA_EXT_V:
-		return riscv_v_vstate_ctrl_user_allowed();
 	default:
 		break;
 	}
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
