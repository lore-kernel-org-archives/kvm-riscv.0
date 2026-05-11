Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2BBCD37B9
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ihkrps3ahdvWrwmwiPlFPaUsLLNRdrkPtVIKDcvrUbA=; b=AgxOCwOWz5mJQh
	T03I4izJbbWy/PVlOvf/vKPgq20mDybkmF2UkI/Z7Qpc+1VGCsonVAVJwOqM93Cvb2PIu0rsfzqXG
	cJhrcMJ2PWpcTRV0vWDiMCngQ8wpe7+lNQQfvfs+NeYe/3QYS4EE46emou27OLc7d0+WlwYbxDmcm
	8aWBbXUmmebnjZJdCPeO+c+Tfc0SrajrDuWjNwGsinhlCHXbiDTq9mOS7JWFNxrBn0IWdWg2fg9M7
	H+stMK3YphkjS8jl9jFn/iSwcNvPbQxVE9oGHS8XmkYpoFYotMOUB1kEnEWjjmYd6BrHqcv1f7CjN
	rdweqPEtm6M/pGoUfWbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOqp-0000000DKV4-44qL;
	Mon, 11 May 2026 11:31:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOql-0000000DKTw-0oAL;
	Mon, 11 May 2026 11:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Subject:Cc:To:From:
	Mime-Version:Date:References:In-Reply-To:Message-Id:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GarQ9hJWYMIDDIdsyOnJdUlE124XUc1xLB+gYTY7Geo=; b=rfj22+5tC2ykA3LUNEUGL01AiX
	wfHkO4VN3D/vGZh/SMApurOLDrGuERkckRSScE/BHz20Al/fcEigIIzy5nKa5qtSk50+mdLgfLfAU
	hrFn0RrxkCW/3SLfZ5+7hJp00SqBRcy3ZZWpRQrP3C6ZVXGsCo13u6UtK2PwC2VnmL6k9u6GSU7wI
	lbBCX/HaM5tEaHPNr7+fHchFkZuPGnGeRPKa520nnyGPjmeF1topicIaks7sxdUiRBSeyQFonEawl
	wlXQbyhwCq2NYUDhS2Havg5hIM+FQM+gaTU0YftvFka5oWmZy0qxXauIbp2NlBm11FeWcEhLlLV3n
	Vr4YGyjQ==;
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOqe-0000000BTeD-2oX0;
	Mon, 11 May 2026 11:31:01 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gDcwm1B91z5BNRf;
	Mon, 11 May 2026 19:30:48 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 64BBUjU6013213;
	Mon, 11 May 2026 19:30:45 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202605111130.64BBUjU6013213@mse-fl2.zte.com.cn>
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl2.zte.com.cn with SMTP id 64BBOdCA006778;
	Mon, 11 May 2026 19:24:39 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid204;
	Mon, 11 May 2026 19:24:42 +0800 (CST)
X-Zmail-TransId: 2afb6a01bc7a786-9563d
X-Mailer: Zmail v1.0
In-Reply-To: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn>
References: 202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn
Date: Mon, 11 May 2026 19:24:42 +0800 (CST)
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <linux-kselftest@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>
Cc: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <pbonzini@redhat.com>, <shuah@kernel.org>, <wu.fei9@sanechips.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDIvM10gUklTQy1WOiBLVk06IEZpeCBza2lwIG9mIHZhbGlkIHBhZ2VzIGluwqBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3Jhbmdl?=
X-MAIL: mse-fl2.zte.com.cn 64BBUjU6013213
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Mon, 11 May 2026 19:30:48 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A01BDE8.000/4gDcwm1B91z5BNRf
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_123057_335417_082436EF 
X-CRM114-Status: UNSURE (   8.54  )
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

The current gstage range walker unconditionally advances by 'page_size'
when a leaf PTE is not found, e.g. when the range to wp is
[0xfffff01fc000, 0xfffff023c000) and page_size is 2MB, if found_leaf of
0xfffff01fc000 returns false, it skip the whole range, but it's possible
to have valid entries in [0xfffff0200000, 0xfffff023c000).

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
---
 arch/riscv/kvm/gstage.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index d9fe8be2a151..2b141a78ecac 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -429,14 +429,14 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
                if (ret)
                        break;

-               if (!found_leaf)
-                       goto next;
-
-               addr = ALIGN_DOWN(addr, page_size);
-               kvm_riscv_gstage_op_pte(gstage, addr, ptep,
-                                       ptep_level, GSTAGE_OP_WP);
-next:
-               addr += page_size;
+               if (!found_leaf) {
+                       addr = ALIGN(addr + 1, page_size);
+               } else {
+                       addr = ALIGN_DOWN(addr, page_size);
+                       kvm_riscv_gstage_op_pte(gstage, addr, ptep,
+                                               ptep_level, GSTAGE_OP_WP);
+                       addr += page_size;
+               }
        }
 }

--
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
