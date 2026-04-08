Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6011FD5F6C
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 04:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rD0e8KyWsVyi+9xdQJFdVch2Samjxup2IMIYLtB/buE=; b=J7zr2r6P2k4H7N
	/cGkzMxC60mq59vBzsiYE80w0e+jD/MNVEZD70QQAMksTnC7IoXXftLtJkoumgIPn9ptoXN86t3gM
	bX9/ao5FhgjtauDlT656xIQI+lqpC5D7fymDlkwL1JOQjjCXnpU5c4GRsJ1Z/1SnQo/eaJKFIGaex
	LJSLSlNtBJ0DsfSSMpi2Q2wq4AG8tP7E3+QeZJ48IOqGBUEBiFHDdElwfSeGLFkJD3JyeTe8om6ZG
	37QWobiv4iunDufb6TMNFUY1ZCUEsA5Ib9AyBPTKW6o6h/2l5OjYqXhiHcoH9tL7l5JxiFUUd2sHq
	HG5GLMLvScJbQERZL0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoP-00000008Eki-1dSH;
	Wed, 08 Apr 2026 04:46:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoJ-00000008EbZ-2Tym;
	Wed, 08 Apr 2026 04:46:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BC2B4448E;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04222C2BC9E;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775623597;
	bh=w9IsCz5C65o7SYnzaV255DXsVBXf9lMSVjahsf+0d3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=io0i1S8zyNDeTdGN4yJaLqlYa3RQFwnmCi4dvTfsmB2ngjDUDhE/WQLWOWF+CeeJ9
	 BAT8GTZW0ZcY3sps7tDwnjuoyZkimy2L7GSB2nrFrgBMUZAe5XHDUwBCwAOYRM0PAn
	 +RrdMZ+Jy5VUxB0KUVMQDgjmiAxUOu4A7HUO40NJNu/BJUFxQb0+cdxCxyCK4fExlG
	 T7rtuG0Y1EMKogDfx61PbO98rUM5xMdz4qZkXE4Nh/NVmic717s84V3Vc2PQQjj57X
	 TxsbbHANRbqjMEk96gWw98BjyjLIr/0ATUvCFdK+V56MGGC9q/w7aYhDTaAaHrrhHw
	 Zqlez72oIvsyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F143FFD5F73;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Tue, 07 Apr 2026 21:45:56 -0700
Subject: [PATCH 08/16] riscv: kvm: Fix MMIO emulation for sign-extended
 insns
MIME-Version: 1.0
Message-Id: <20260407-riscv_insn_table-v1-8-54b4736a1e77@gmail.com>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
In-Reply-To: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775623594; l=1861;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=lGPhHeZyq2cBn6D6Rrw+L7g4NlITgLWo0A/2zvmf7AE=;
 b=db8eDgJl+Lxj01XnGSTnQdW6SSxHQwG8ehZ9ti7lZbKgg//zvLEF/VtHi7aOf3Qg/NPY9t3iw
 b6GSI/ckqNOCYdESWlISYlmDPk5zSHfsQP5PliI0bV5S5BiyNWqbc/M
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_214639_703448_41881F5A 
X-CRM114-Status: GOOD (  10.37  )
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

KVM MMIO emulation failed to sign extend any signed reads and at the
same time also unsuccessfully attempted to sign extend reads using lbu.
Remove the shifting for lbu to avoid sign extension for that
instruction and cast the data to a signed long instead of an unsigned
long to allow for sign extension.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/kvm/vcpu_insn.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 62c4510a40af..311e2530f888 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -416,7 +416,6 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		shift = 8 * (sizeof(ulong) - len);
 	} else if ((insn & INSN_MASK_LBU) == INSN_MATCH_LBU) {
 		len = 1;
-		shift = 8 * (sizeof(ulong) - len);
 #ifdef CONFIG_64BIT
 	} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
 		len = 8;
@@ -650,22 +649,22 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	case 1:
 		data8 = *((u8 *)run->mmio.data);
 		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data8 << shift >> shift);
+			(long)data8 << shift >> shift);
 		break;
 	case 2:
 		data16 = *((u16 *)run->mmio.data);
 		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data16 << shift >> shift);
+			(long)data16 << shift >> shift);
 		break;
 	case 4:
 		data32 = *((u32 *)run->mmio.data);
 		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data32 << shift >> shift);
+			(long)data32 << shift >> shift);
 		break;
 	case 8:
 		data64 = *((u64 *)run->mmio.data);
 		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data64 << shift >> shift);
+			(long)data64 << shift >> shift);
 		break;
 	default:
 		return -EOPNOTSUPP;

-- 
2.52.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
