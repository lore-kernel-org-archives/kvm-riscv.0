Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85383C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/8CGGn7aM4J1aH2taDeuUHC2PX/wY9A6pWa/JtmhQMQ=; b=OBJag13+VVAs3tLWJZUmCUst9a
	keuhzCebHS4Kyr+Bxg1fJ0kpoEfq6foJKARCCV109MpAt+CiFcRXY961LpG2gDAcNAQH7pCyWNYvV
	YpAxCz9MiNjfJGrqJBE60LnP/h/hQ7a7iYW+wcR2TJJnWvPUOiAWT/fedz2Ni18JIkKhJH7ZyW/K6
	pRkMQSdiqY5iLOQ/dzVdVpygjURFu931rMNuWIC+ycWH2oXz1tStceSodV12SMR4zGT395F9L0AO4
	8/zmfSpay0msStsEJHl13LORYuhnoMFt8wNJtO/rLL5RGlOl01Oue7DcgkvTUdX/qOoMIc3sY16u1
	EDGalvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuD1k-00000003H9d-0XBf;
	Mon, 17 Mar 2025 16:09:20 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuD0c-00000003Guf-1XvV
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 16:08:12 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff8a2c7912so3424819a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 09:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742227689; x=1742832489; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kFGsIS9GUasJNsr+AyNzSWrAC+Oat7GEq5DJqh+FPjE=;
        b=sKbQSoaM81/C1sBuTJjqlS+UDdNskMvVB4ih/DY7oMqOHTgNs64CvPZViZSewJTUvX
         QLundUx9O5IkC3S70mVU59qBHO2BVEVE+Sx2bkdQBJiwBqRvam6YNodRCYFT2Ivud6M7
         EglrcaCnmegZtj53FI9iAKLJj2n1FpmJ5YwkNw8GJCWITZEbf/0S06/3mTH610HZ5dk4
         PEw94LjyS95klGD7rWCjCQ/5wzd88LwnkhBKCLxceiU5k4x5Cr1u6fXUd+s36JCotW1j
         Jbz3c5b2E51DWUFmjuvhTwPo0nI4oFYPs0PtuMsN5ghOiAIeI8+RRVaoBD0t0aimGEUl
         pu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227689; x=1742832489;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFGsIS9GUasJNsr+AyNzSWrAC+Oat7GEq5DJqh+FPjE=;
        b=P4rRJANN1jDmHGT1soEF64m1sRZcevfIdoaXQGDe3o1AGWShNNhhABqad7fbHqkZ4f
         hnJmQ7Z5mGP1Xo2hb6KE1RxzEYLsuHPxri5ZK+O0YVzOljKb9TTzcDY6M+C/FdKZC0YH
         wrH5bn80YcQM3q6cHD+iI8fEVMahcKwTr9N5fNLugHOXaH9tHQOFszCseeDNKrg7+2kU
         tLhmMgQ9ESw0C+DKAMlTrtDBYEu0oPZKCfc5Ve2ewGoOOBOezzC4vF6j9hPLq+2uYcya
         cBSUUMiHKVOCRk2NkWPpQBYTIj0VaTurDehp9X4nM8UG9kxdZcvofSF0MFBpEgNAtg31
         PMwA==
X-Forwarded-Encrypted: i=1; AJvYcCWvpHquTJykeXsnlLjAt/eS2VYKqesqY4fF1xufzzmaIFzSAPKOMeKUsGrjYGWwMogNE9J0pla7GfA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx28y6uQ7dvEo6vENnqiEQs9zVDqnTh7on/UbgskqhoCzOkH/k0
	jkuMg5c+A2STapZS/FeYUE0ouA2eE4aIC0zN0JzqHJUqctpebNEuOvb1A0gFKJvN76tlPppdASg
	O1oOJwKnNybSHA2PklnwgOkrwIHX6B1Xu/G5RBgymfVi2NSVx/raXzS4UCyAiokDoewwZ
X-Google-Smtp-Source: AGHT+IF+hruQfmOR7ShC4vLyikmFYkRsFWDD656xmQF7xQnZ3FiYAQLSOrsH0dqIoNXqWj4kGILXNWg7yAo=
X-Received: from pjbli15.prod.google.com ([2002:a17:90b:48cf:b0:2ef:d136:17fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e48:b0:2fa:4926:d18d
 with SMTP id 98e67ed59e1d1-3019f4f043cmr10445a91.13.1742227688937; Mon, 17
 Mar 2025 09:08:08 -0700 (PDT)
Date: Mon, 17 Mar 2025 09:08:06 -0700
In-Reply-To: <20250317-kvm_exit_fix-v1-1-aa5240c5dbd2@rivosinc.com>
Mime-Version: 1.0
References: <20250317-kvm_exit_fix-v1-1-aa5240c5dbd2@rivosinc.com>
Message-ID: <Z9hI5vEHngcKvvRa@google.com>
Subject: Re: [PATCH] RISC-V: KVM: Teardown riscv specific bits after kvm_exit
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <apatel@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-ccpol: medium
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_090810_415510_9E5C1ED4 
X-CRM114-Status: GOOD (  18.41  )
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

On Mon, Mar 17, 2025, Atish Patra wrote:
> During a module removal, kvm_exit invokes arch specific disable
> call which disables AIA. However, we invoke aia_exit before kvm_exit
> resulting in the following warning. KVM kernel module can't be inserted
> afterwards due to inconsistent state of IRQ.
> 
> [25469.031389] percpu IRQ 31 still enabled on CPU0!
> [25469.031732] WARNING: CPU: 3 PID: 943 at kernel/irq/manage.c:2476 __free_percpu_irq+0xa2/0x150
> [25469.031804] Modules linked in: kvm(-)
> [25469.031848] CPU: 3 UID: 0 PID: 943 Comm: rmmod Not tainted 6.14.0-rc5-06947-g91c763118f47-dirty #2
> [25469.031905] Hardware name: riscv-virtio,qemu (DT)
> [25469.031928] epc : __free_percpu_irq+0xa2/0x150
> [25469.031976]  ra : __free_percpu_irq+0xa2/0x150
> [25469.032197] epc : ffffffff8007db1e ra : ffffffff8007db1e sp : ff2000000088bd50
> [25469.032241]  gp : ffffffff8131cef8 tp : ff60000080b96400 t0 : ff2000000088baf8
> [25469.032285]  t1 : fffffffffffffffc t2 : 5249207570637265 s0 : ff2000000088bd90
> [25469.032329]  s1 : ff60000098b21080 a0 : 037d527a15eb4f00 a1 : 037d527a15eb4f00
> [25469.032372]  a2 : 0000000000000023 a3 : 0000000000000001 a4 : ffffffff8122dbf8
> [25469.032410]  a5 : 0000000000000fff a6 : 0000000000000000 a7 : ffffffff8122dc10
> [25469.032448]  s2 : ff60000080c22eb0 s3 : 0000000200000022 s4 : 000000000000001f
> [25469.032488]  s5 : ff60000080c22e00 s6 : ffffffff80c351c0 s7 : 0000000000000000
> [25469.032582]  s8 : 0000000000000003 s9 : 000055556b7fb490 s10: 00007ffff0e12fa0
> [25469.032621]  s11: 00007ffff0e13e9a t3 : ffffffff81354ac7 t4 : ffffffff81354ac7
> [25469.032664]  t5 : ffffffff81354ac8 t6 : ffffffff81354ac7
> [25469.032698] status: 0000000200000100 badaddr: ffffffff8007db1e cause: 0000000000000003
> [25469.032738] [<ffffffff8007db1e>] __free_percpu_irq+0xa2/0x150
> [25469.032797] [<ffffffff8007dbfc>] free_percpu_irq+0x30/0x5e
> [25469.032856] [<ffffffff013a57dc>] kvm_riscv_aia_exit+0x40/0x42 [kvm]
> [25469.033947] [<ffffffff013b4e82>] cleanup_module+0x10/0x32 [kvm]
> [25469.035300] [<ffffffff8009b150>] __riscv_sys_delete_module+0x18e/0x1fc
> [25469.035374] [<ffffffff8000c1ca>] syscall_handler+0x3a/0x46
> [25469.035456] [<ffffffff809ec9a4>] do_trap_ecall_u+0x72/0x134
> [25469.035536] [<ffffffff809f5e18>] handle_exception+0x148/0x156
> 
> Invoke aia_exit and other arch specific cleanup functions after kvm_exit
> so that disable gets a chance to be called first before exit.
> 
> Fixes: 54e43320c2ba ("RISC-V: KVM: Initial skeletal support for AIA")
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---

FWIW,

Reviewed-by: Sean Christopherson <seanjc@google.com>

>  arch/riscv/kvm/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 1fa8be5ee509..4b24705dc63a 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -172,8 +172,8 @@ module_init(riscv_kvm_init);
>  
>  static void __exit riscv_kvm_exit(void)
>  {
> -	kvm_riscv_teardown();
> -
>  	kvm_exit();
> +
> +	kvm_riscv_teardown();

I wonder if there's a way we can guard against kvm_init()/kvm_exit() being called
too early/late.  x86 had similar bugs for a very long time, e.g. see commit
e32b120071ea ("KVM: VMX: Do _all_ initialization before exposing /dev/kvm to userspace").

E.g. maybe we do something like create+destroy a VM at the end of kvm_init() and
the beginning of kvm_exit()?  Not sure if that would work for kvm_exit(), but it
should definitely be fine for kvm_init().

It wouldn't prevent bugs, but maybe it would help detect them during development?

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
