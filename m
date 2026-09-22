Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CB4C982FD
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 02:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NiRapy0m04EAlHua3aheMQ75vlgDxhJFPtUg62Ww9/Y=; b=MUhCHAphQDGJ2L
	FBTn8ZZrqRvBVDjZpkbU/hFCkhZyfsaR7jHkBww7gFALAqseZsDWifVgj0uYP8zP45LyLRZ8FF0rv
	7xW7p8i3Wz1U3Rvp7nOdOdNrxJCbiTUm4a66Nfg6hHSs3BmagDxYal7BzVIGL2CaAcZMXIQh5KXhz
	WDlR4lHpQp+83P0k5reShfMZUu9WwViI3+ixv6YOLA1aKbPQyShcKfVVffx4nVf9XVOq+Amuqe71b
	LimvrlPNeLWt7B4nQtN6HoQTQTu9FYjYXOUrPbZbfSzMCWN9ESEgHfRfdkJhwKRMC+ze+oGY0BkC2
	5BvZTzJS9T6NfJ2E/YcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8q5t-00000003xce-1HcK;
	Tue, 22 Sep 2026 02:18:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8q5r-00000003xbu-0aJ9
	for kvm-riscv@bombadil.infradead.org;
	Tue, 22 Sep 2026 02:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5WQok9u00TIs2XVurEer//vmyvUbX92gGWOe15d0Bq0=; b=mRtoGsp44Ps/JBGDVbLWgww0EO
	K9CwNGY2rSQ3m4r/JhpEnSE/ZZZvaO3cU45sFWei3Le9eOfbwRyJuxR6V7NEtp16nQf2uAPsls2J/
	HJamc7liTVgxF0J6q9Fpe1jSjI6P73jhlX21o0OMy0QZDJoGAC4+Ta2E9fCgY3IGfhjoRDbdCWwld
	CKTN1vtR3NYXxfJt70qixOGCRknU/la1156wQaRuj3KWWKdq2Q03ArSfKXVgeQQVh72bdZ0gDu9Q7
	ASKoc4udU2c143hXsC3V8mGNyeDFoorDQHPYJyfl1/dsmeEHwN7FC+u4qAWzDL/15wd5nTpuXlMYM
	C6OsdT2g==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8q5n-0000000D0SL-0Mwr
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 02:18:49 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396cccbba91so2522910a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 19:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790043523; x=1790648323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WQok9u00TIs2XVurEer//vmyvUbX92gGWOe15d0Bq0=;
        b=UYWZdb4y14jDHsD2pHpEucbToXdWa+rmqfBD+Xz/PAKgkYfACah60iNaicynwkRh8d
         u1jArA/zwWuDYf3eEaxGZ29LJ7+P7eow2nhUQ+Jv0Pb5jI/G483vEKEOSOK5xuuyWY32
         OIBQqYVLYY+ju22nwm5t/a6LE+Th8X9uMzByZjzsoDK5Vr0BeLqwojnmOoTWnzRykAtN
         5K+RcpFSU2kS3Oe7kFzFfPuzpARcwFQC154EXSn0hoCVa/zAkox+VeR3Cf8Y25MK0stL
         yxfPEPS1bUnpKTSZMRZaG07b7Nq8NxIVXcGM0UPT0SrtJhB8ZF2tCG6w6uue46Eg4Gu5
         HSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790043523; x=1790648323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WQok9u00TIs2XVurEer//vmyvUbX92gGWOe15d0Bq0=;
        b=b+InRv+ZR/cAEf7IYnhR7IK378ftD08vbHNZZ6ZISGXqeUSconnysRZk0pP8cTcNz4
         rnJDYF1I39vt6QKfueAuLrfmgqfttV6r4KKAtx3TLDkhxYrsxFdfZVRTgnwZlkIklnk5
         jhZCCAyMbUu8pMC+xOGf0FTJrXTd30pPXeNKbIO6ic5wiUje3dF+h2a/0rMWOrbksgwJ
         rDtJLfq1rJO8Qqqes3VkOQgmtDEbbh5Ju+lbX91eXkfjyqPI1nhBtRpqNUPHBRtS6BRG
         gEr+VDVuNVDVlyLMjy7Z3ribCDMxa9q+H3nnoBc1+aTwjS2Lj0OD4kCUZpAgyLdRsBqH
         1wtg==
X-Forwarded-Encrypted: i=1; AKwUvBxyb/tzje8bUJBdjgm7gSKN7TeUe5n9+TT0stWuVp67yWPw/OPydZwQ3++p/+JRbX1bgiVKfkQsPlQ=@lists.infradead.org
X-Gm-Message-State: AFuF++l5wfZEZZ9JZYdsnbT8bzdAdspYgtd65vNBrTgcpydf2/TajYTf
	4/cLc/IwJEq7PahdmPvCKmD9PzAC+W79dmQuAb59pr+mh20Jw6gfFNnjhsfmMj2IRY8=
X-Gm-Gg: AYBFou0tsZaDxcfYUNC9KXy9h8j3o9UCTNgp1Qol1KXTMGms7sgMLTZ1GdWTbH2CPPU
	duIFSKn9Ko2MQie4SXmRPTE3MAxMcj3HhBdp+HbfJQFVMyLfENaXlF33gJMT66jf401W4M9AWWw
	CEulQ82aQerrPuDBVcqGKK44P8h/YtFK1WYR4WFzXVNkv+C9Mek3qeLrXXQA5mKaUSmab6cC5O3
	fih5+WzdP6oARj5EPKqN5hv1xuNk0U/hozvgo4LUw5o62a019H0wZa6iu+tf57JGduBkHy+tF3E
	9P+yTxCIHaoORnHoPkSgsKpz3zK4w2AObd0MR76DJZ6PDdP+pPfAcnAz6P7aVC4UzCDFkzyYjPB
	uicm+eGaPI9Xgjap89Gm3UEmyeuBDIUnR8i1/VE6C2ksEaGyzwUhSYwytPmtvVlZ9vFSI2qUdsW
	wvXKPbZNv1rJ0YR92frGNz8BGXxF3zFvLhBTMMxcsOhbugQf4Y5L3h9FU9EiWw1BLalPuiThVOu
	AYTh9X7GI6RwQFE7olQRHFnOcji6pmJgaLgqyXwtalX9XFetrsru3cYefmvTw==
X-Received: by 2002:a17:90b:590e:b0:39e:5166:df84 with SMTP id 98e67ed59e1d1-39e54d1121bmr18157424a91.16.1790043522580;
        Mon, 21 Sep 2026 19:18:42 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([139.177.225.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06747204csm1823793a91.11.2026.09.21.19.18.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 19:18:40 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Andy Chiu <tchiu@tenstorrent.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH] RISC-V: KVM: Fix build with vector support disabled
Date: Tue, 22 Sep 2026 10:18:24 +0800
Message-ID: <20260922021823.44251-2-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_031847_624758_11F14B20 
X-CRM114-Status: UNSURE (   9.71  )
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

The kernel-mode vector context handling added unconditional calls to
get_cpu_vector_context(), put_cpu_vector_context() and
__kvm_riscv_vector_restore() in vcpu.c. With CONFIG_RISCV_ISA_V=n, these
calls fail to build due to missing declarations.

The get/put helpers already have no-op definitions in asm/vector.h, but
kvm_vcpu_vector.h only includes that header when CONFIG_RISCV_ISA_V is
enabled. Include it unconditionally and provide a no-op implementation
of __kvm_riscv_vector_restore() for the disabled configuration, matching
the other vector context helpers.

The paths that set RISCV_V_VCPU_NEED_RESTORE are compiled out when vector
support is disabled, so the restore stub does not discard any live
vector state. Keep it __always_inline for its noinstr caller. The vector
enabled implementation is unchanged.

Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/kvm_vcpu_vector.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 6371d5ea5392..50d4789b9cac 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -11,9 +11,9 @@
 #define __KVM_VCPU_RISCV_VECTOR_H
 
 #include <linux/types.h>
+#include <asm/vector.h>
 
 #ifdef CONFIG_RISCV_ISA_V
-#include <asm/vector.h>
 #include <asm/kvm_host.h>
 
 static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
@@ -55,6 +55,10 @@ static inline void kvm_riscv_v_exit(void)
 
 struct kvm_cpu_context;
 
+static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
+{
+}
+
 static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 {
 }

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.50.1 (Apple Git-155)


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
