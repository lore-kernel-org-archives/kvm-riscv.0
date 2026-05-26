Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF73CD5BB4
	for <kvm-riscv@archiver.kernel.org>; Tue, 26 May 2026 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n3bpRJOZFkmw9G6uMsNTduJw0AFg7Nb1bUgIH7X7nUI=; b=pj9tUTYmu++4z/
	buvkMWkjWAEIkqWi2Sht7xgZQuu/OcVu+3MikaeWaGXo8/Xgj7hHpVJXKrLQwCpRGaX/GQ8eV9EWk
	E7T0IGw7JeAORTl+FBYC/hye7ZU8Ne3pS011XsMrpPBCQuqt7/6U0B8rjqD+KqDzRY6sTeQQ/WTUe
	IIAjzBO9inB8c2WLYxKq4BsV12qIHgJ/fenKzguwiKLADVVMTWohQaG1VD5ZzH6P9YZMzhgS131IC
	nW2JLMolInToNEddHH93Jt2a+n/RlAs/lbHWB+V23fvmzw2shcr0eaAwarN0FRSQ+48la+ev61Lqf
	is5/8dbZceC7GYdp+Sxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmfl-00000001K4o-3ar4;
	Tue, 26 May 2026 07:57:57 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmfi-00000001K37-1Tj7;
	Tue, 26 May 2026 07:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779782181;
	bh=UiwhJn3VYjvIdwS+YrcKQwv+LwDF4GDtkBEy0aj+ECs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=DnFlhe5s4xcd59KHCxi6ariBnc05uYiOQ7BpwOgVuk/O+7dHrHu8ZphQUP8wY52nT
	 JDvxFpnANe3jsFVaq7PtyyahwUD32g22mvR5dR5ku6up1Oc4+1IBjOE5ExrzkCYjtt
	 llxy3rqq3fx96FHOKGL8QUEXjko/A9XBOfw0FH2E=
X-QQ-mid: esmtpsz16t1779782160t4aa77563
X-QQ-Originating-IP: CGFhapbqFt62t2SDAMmy8wPmz78bXl9QfPr+2tphAcE=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 26 May 2026 15:55:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14842016682969413512
EX-QQ-RecipientCnt: 11
From: Qiang Ma <maqianga@uniontech.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH] RISC-V: KVM: Fix timer state restore
Date: Tue, 26 May 2026 15:55:44 +0800
Message-Id: <20260526075544.796396-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NEaes6yu2o+m2XTd/LhaqqpYIDlG8CLVa/wqcoYk1tp/p/OryyIRVSel
	Gc8vXUCptpw709bluAgmyuQpCVip9JI/Suc73a5Eqj/h6AMok/YXZsLadipgHRBV2l2VLCZ
	hRk45coJ/vtCO6Dh6eCcVVj+KN7jDE3XXm4r6tglHPoHZRIFcOg58F5kOJ9e8T+j7JihKmA
	+IZ2xFmF0Z7cbhpl+Wb4bQPzM+mT92/SlMOvyTSnLRIrMgd9Bw7GSjGoABuC2PM5lAp3Lsz
	QcczPuR+3Ta3EZybtkx2NMkSv2wwkIaN0Fkszbq/wWC7pbbA0OG6AVlpzAcSjWpfFsEj8Hf
	MrbgG+kTnfY3NSynK/3WZK58lB0Ee1rhIhJj1FW7jvqg9GUW6Xq64jQZgBUXGrkmJcj0yuh
	fMRYzvUn3yzEAK2gf9ta73VDfTKsHo0u6eA05MEtUiKAcE4C/jwy6pENGTwOGDrqOyxxeJr
	Zv3MxWOfeYeQBB7oMioU9eV1IjriCbfzlV0VQseCG4o29eaDQcZo4HMZofgE1HpMEylrvrZ
	hSk9IDnwHKX1Ja87yi7tD4KM0D6ElL2XK3urVYZn/Z5tgqaCRA+0aFMHBOUpIPY2k6ZDtMN
	fKpvFjpbmRQkYHNZGDdXj8e2LfOKTfz2/rg3PJqNg5b15Ph55TyA5Zt1gbSIMO1KbtgtUdk
	S4Fy7U0Vum1tOnsan1K3zQ8JLAvgdteMzMr6mMZeupEncJYR9gDM0SQ6LU2NAmhDFiZ2ytV
	PTK6sS0RGa+ikj1VER0z+NA8JnJCZjYRkgUuCKOVKz5Ji8kdVvw15odGNqULz+O1GXCVpCE
	J4vaip9MtSParGZOUJv/KF5Rjkr+FoV0RNoRMj5ZaaqS3n5mGOI40c6z76eMCqbyI6yXmKm
	y4Qbx8gAvD4GUpmCXdi/FSgN9yJq1iS0ZwHEfQ9FZ3tVC0C5X/BzkSgUCxHbOL1n6tbqFE6
	9UQd5dyq5LhbdNOdu7UcPKFt4yjYR72M8U1D55HD6XT2GGdnorUg8irVmgMqV6mCnb2aHR8
	ulyOr3eXLj8jH8kL5o3SmscwDV8GiKHFKQdq1E3w==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_005754_690566_7EA22EDE 
X-CRM114-Status: GOOD (  10.74  )
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

The KVM_REG_RISCV_TIMER_REG(state) one-reg write passes the value
written by userspace to kvm_riscv_vcpu_timer_next_event() when
re-enabling the timer.

That value is the timer state, KVM_RISCV_TIMER_STATE_ON, not the
timer compare value. During migration or state restore, userspace
restores the compare register separately, which stores the target
cycle in t->next_cycles. Re-arming the timer with the state value
schedules the next event at cycle 1 instead of the restored compare
value, causing the virtual timer to fire too early.

Use the restored compare value from t->next_cycles when turning the
timer back on.

Fixes: 3a9f66cb25e1 ("RISC-V: KVM: Add timer functionality")

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 arch/riscv/kvm/vcpu_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 9817ff802821..ae53133c7ab0 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -231,7 +231,7 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 		break;
 	case KVM_REG_RISCV_TIMER_REG(state):
 		if (reg_val == KVM_RISCV_TIMER_STATE_ON)
-			ret = kvm_riscv_vcpu_timer_next_event(vcpu, reg_val);
+			ret = kvm_riscv_vcpu_timer_next_event(vcpu, t->next_cycles);
 		else
 			ret = kvm_riscv_vcpu_timer_cancel(t);
 		break;
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
