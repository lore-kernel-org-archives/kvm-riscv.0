Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20918CA5FFC
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMZ04yaakEfSE/DW9+oeRO3+XWLEyMctvyu3nHxg/4w=; b=fwD4fxW6yWf2bt
	hQmvS47vn+hMzsujLZbbew0HZZAiD4cZj1bq6wyO4TDSmeQXPPkpkXkf5fAbhpmBt47qfwNxZeagw
	pyEims7XXSyV/T+pgYsD1JPLWl2E+pZJyWNEZ81OufGaMXzOoiAgmQO3fS4j9scklrFBoTYgvonlv
	HUOLLMmsRU8KeWdrIHrJIx0fhQYnLmyPNssmtoAmgZB2MBqPZpIjM2mDVzXaKG5rIYZmZ9h8qU3+5
	h4Ot48uttzO80tzFJwa8QROR/lWeIHIKKWxWXnBreVVEueX3ScXWQIAhIiNhl8U244r3Um2ukWgJz
	hObKlEd/OddrJ5OJg0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPoZ-00000002JGQ-2hdv;
	Wed, 07 Oct 2026 11:28:03 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPoW-00000002JFN-3XZM
	for kvm-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 11:28:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48c45111bebso1178374f8f.0
        for <kvm-riscv@lists.infradead.org>; Wed, 07 Oct 2026 04:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791372479; x=1791977279; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N25GKi4KKDEgKB7UY+JEtW1Q7H8cAQfRQt0G3e7XtJc=;
        b=pw90M0HI/BNdeEPk4rOoeSvAB4skkgp+u+Ha8BcWAmnr43gJEnH3IawwCd9ku+djpT
         w31krxO4601BqNIaNy7eQACnW1uDxS+5Nhkse/ZaPh9P4D6wwiRhniffsSqlGtC9NoP4
         1WaqbjsMikqByhHI5BYaUWbhgh73/YaJwd6/TgeyDk4KPQ6i9ShN83L/aQQ7CIC9fIv+
         8hk92l9hJEZkk07YLS9wxtyivYa8sh+5Vh3mDbhxzsE1oQNGgD+VFUf0850ESa1YbISl
         apW2yCryxlVYfUb4gNSt4JrrUnh9nHI7LCAbtR7f/kgKK6OlvIeJzDmLvS2VmOukeSJZ
         5XIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372479; x=1791977279;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N25GKi4KKDEgKB7UY+JEtW1Q7H8cAQfRQt0G3e7XtJc=;
        b=OMX0YSOEtoId0pF6op9pcva8/IYGs7RUMZewlDcwR1QLU+0HjMcWWxYvQCePcD1O1z
         8ZHOrFMA+4kZ1cXE6SryWQnbjpgzSkm8C3TAooosO8o2vY9n07DH2px9rvWBqXO+q1DM
         8rLC3jR0kCbl4e8pOwQNMY0SjqAFRZYdkE/3rjzVOfI2mn0bnRdnfbscxYBG4N97DI63
         TPAq7g36U/ZgOMeCwo/N4TZvjkctb1ti1K2wkBrM2mkLLkPKsWUPs63bGsqr6r+mCXcc
         dTwYNQCseuQQYGZZlbbe+f4L5AdXBiYp49srf4FgEYRGWBBxCAhUPcxG+NacLVI37Ao9
         hZTg==
X-Forwarded-Encrypted: i=1; AKwUvByMmFBvVYdrfYqTa7VAOd3ukBj1Mok6v3U0p+ju+DBZfQjF9P+gTprY8d31ou5luNkF4PQrQSlHn1g=@lists.infradead.org
X-Gm-Message-State: AFq9FYIhRFEZ7grPvaGLmKKJ+lPgR/J9SieovlmjAIrDuslrwKjklFGO
	mJfT8EA5UEty8q90KhBaw6TIFQDLj2k0n8VPIIFRZfnwNhfOvBgWBqyD
X-Gm-Gg: AYBFou0syqa8yesbxkmYDmrqfN9UZ1Vkbj2e4rnS0ioZOzP6PHQDuHKKjBM7LWrkgwo
	q9JSQsCdb+BEHygfWyQ06t+eNX/UxMUlMaSI5X+2WyVPvHZEwvQN5DqlKigudtG8sX+Mwu9Cbcn
	Voeq48LJ1dFt/htC5ykPQVoMmJE93ujAZtLurIX7EoB2uZ8rDUNhNjObunXZPaVDZHyWGiCFVin
	O2gpQGai5QxK6vM57JfXtueNi48YSgN+0ebuM+O3k3H1GAdXZhJzgo+xuv0oHANs34RkzYNd9p/
	2GnsIsWy3qsNvEJul8VDI4CFclTz3Amr1VA7UBLDwooAjL9fFrStdBqEvoeugsOeHkJkQxjKZZw
	stYovl2NODR6J3tYyCRCifybpRqyTnb/Oa40rZbOxz0bRlGnYmE2egZyYzmFoIXxNX2/eckKT2V
	bwNOpn6C5CcmfZ8mC8y/xJXo46ySQXV3lcxNPS5lks5/96nI+0p8gtTe6X0H/ta3hSC+Z7Syq+X
	PPTbszH/TqJDPe/6q5BHTqe4My/AIGvwLYaZo+flwSwyl2A726YNqYdb7JNrBG4Cg==
X-Received: by 2002:a05:6000:46db:b0:487:15a3:1cab with SMTP id ffacd0b85a97d-48c7275ad2fmr2408703f8f.18.1791372478783;
        Wed, 07 Oct 2026 04:27:58 -0700 (PDT)
Received: from [192.168.141.88] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d22ec8sm4631673f8f.39.2026.10.07.04.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:27:58 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: Fix build with vector support disabled
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Andy Chiu <tchiu@tenstorrent.com>, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
In-Reply-To: <20260922021823.44251-2-zhangzhanpeng.jasper@bytedance.com>
References: <20260922021823.44251-2-zhangzhanpeng.jasper@bytedance.com>
Date: Wed, 07 Oct 2026 04:27:55 -0700
Message-Id: <179137247589.137225.11125498978893340639.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791372478; l=2180;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=UdNnpY1s0JZcKFf12kXtXKzQHcVo0VQb9ksp6zlj8eE=;
 b=N4/1k9PAIKC/zlNc3SD1Pn/ya7soMKpi9nQoq3x35ys4TSjiRf8v2bkGSSm8YfelPHY4YVtCW
 JtOp7Fsds4lASn3a2Wb2XWeDh7BhMwE9O2EQTUj58BfxxJ+9qr0myJF
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_042800_908634_E60D400F 
X-CRM114-Status: GOOD (  15.65  )
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

> The kernel-mode vector context handling added unconditional calls to
> get_cpu_vector_context(), put_cpu_vector_context() and
> __kvm_riscv_vector_restore() in vcpu.c. With CONFIG_RISCV_ISA_V=n, these
> calls fail to build due to missing declarations.
> 
> The get/put helpers already have no-op definitions in asm/vector.h, but
> kvm_vcpu_vector.h only includes that header when CONFIG_RISCV_ISA_V is
> enabled. Include it unconditionally and provide a no-op implementation
> of __kvm_riscv_vector_restore() for the disabled configuration, matching
> the other vector context helpers.
> 
> The paths that set RISCV_V_VCPU_NEED_RESTORE are compiled out when vector
> support is disabled, so the restore stub does not discard any live
> vector state. Keep it __always_inline for its noinstr caller. The vector
> enabled implementation is unchanged.
> 
> Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>

I sent a patch before checking the lists, we can ignore my patch [1] since
this fixes it!

[1] https://lore.kernel.org/all/asWHSd31uyyNvt0a@blinky/

>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
> index 6371d5ea5392..50d4789b9cac 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_vector.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
> @@ -11,9 +11,9 @@
>  #define __KVM_VCPU_RISCV_VECTOR_H
>  
>  #include <linux/types.h>
> +#include <asm/vector.h>
>  
>  #ifdef CONFIG_RISCV_ISA_V
> -#include <asm/vector.h>
>  #include <asm/kvm_host.h>
>  
>  static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
> @@ -55,6 +55,10 @@ static inline void kvm_riscv_v_exit(void)
>  
>  struct kvm_cpu_context;
>  
> +static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
> +{
> +}
> +
>  static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
>  {
>  }

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
