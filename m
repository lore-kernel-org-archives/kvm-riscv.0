Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBB1C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5MbzXQx4SEjeIe7PaArKiXMP+aDNMnaQrzU5XbEEIZ0=; b=A01W6k2qi5gQUI
	r53M3Bhcg2hptKK38VT9Sm85JNYRd4lcKjHfTSw9FLML53C9+1UxJ6jDxlgcmW03iiOZ6O0CgAs/w
	UfwoG7d0nynI84rw8k2ggJraFWdOSAp/qZmkiSVwcITM28TY1VEGCd5DzjTz1JUtBV7upby0VrS0t
	/Jxeu34xpkSAVs1fUIbZMs/06xblaerdveRM4pLup+FoNaLv8WUTNoM7dRYAx3b16Y8xIpNLvgqBa
	fkdR2MOlw5TLck0b8AuFAbtkRXZqnhRM3xih3EsGxUeUO2ROqd2vy1cOP2pF2BHo4RhWoKr9Ah21d
	oYiNWASLyUAqzTcTqpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu56f-00000001cHk-3ONC;
	Mon, 17 Mar 2025 07:41:53 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu56d-00000001cGy-1hQ6
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 07:41:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223f4c06e9fso67287735ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 00:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742197310; x=1742802110; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BWPfpt8VAXB3af6uH6FGAR6gVvoFFmvCHpj+nN5EIrc=;
        b=17/OSxQzgnOAq4hIA1e4bYfX4nOlzjcdt1px4yNW7ELyB8ll3Qur622ChX9Xj7ehmq
         oh9Ot36zWGAjiry64I+RL460A6dSlFUt4O02mfYbzZ+ajJ+kNISgJsK8oEjh9j0Dhvc8
         3oELyTynzoXVI9lepLh4xfZcHBo5ys3o5HEGfpG7FqoOIbOdiPelo4vz54q3L9v2FTsw
         ciqZB4iqEzVlfViFF/zHUxCscmBB/JzYewTkDG+IShkVMzxrQuEtlkJS1MxIzchJzhmj
         MHHxcVBa2+zWi9P9tB0x1aXM2I0hLE7QogudTdjLUhw9ckqBBe1KOXu12VETwngBfhF5
         5mLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742197310; x=1742802110;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWPfpt8VAXB3af6uH6FGAR6gVvoFFmvCHpj+nN5EIrc=;
        b=YZ20b3Lf7i3ln9NBdtLb/4kDkWatuoWGAJagUJS0c8OtTeTh5Tzf65uT8XJ1GLjCD1
         KB373mxO3SewCIDTyGOg0O6kW52pr039UjBQqJQPWAr7r7VDVAvt9BbsioOJQ4Mhhe6h
         nVvpDQF36ej1Alittt8aY77yw5cK81bDZfpFl/eOCv7pfYDLZhR+96100umXdGlFN+0g
         3MY39mbl2J32QY8XCXCZBOxv3g4cG0h9sETFUsbsJl3deT1ZRpeoS9RDJoGv00hhXVTB
         xs03dJoSHY2HUUi2Tzs4LtV/WgZPMs8vhMPyQ5Xjybde/eSAscOYERXCk4wKcma7ujKJ
         GwaA==
X-Forwarded-Encrypted: i=1; AJvYcCWL2zi6n61EnU+QrqX/IiO0git1vo664wctClNZKbWzOKUKc25C5a3GUZ1nQMZIoCT6hFGQB7L+2BY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYH43eq70shdQzMKBQvNZWYAy4gZjU4DrIZgNDyqRba+vMoWX7
	o6QH+z8GqihiT/y9bXBufrjyTBaHThariWs2GCmwiT0HbL9AYrRs9GtX7sUbWFs=
X-Gm-Gg: ASbGncsmCQCDV/5l05bvSzS1crrYNNWpSH225vUWh+0LCa23DDACLp7aOk2dojzejEw
	4IWZ4/gvAwmMtbZil66puAuvtsrdjpCHhnBZeF0Q5oGA9LFyAWLepSzNZFJtWRfs8AhWhIAF4HA
	GE9azONHA4pQnEjKNs9cAITDI2lzMRlsYZcp2TtEk4kXyroozXnO3Lu/yzIS1nTozI3y9A92mVN
	JfzN3xho18cX49cGTbtP1eslZEFS0qXm7XM0KEa1jD3pt2BsL2F2ZpGGjR9YDbH2/vEfq8DDbQh
	42Z3DEWFpL6ywu9EuzWI8AwMRP1Z/9Sb9VQfqdWyOe9TxgPCdLtOYol6ig==
X-Google-Smtp-Source: AGHT+IFs7Rf6sPUtecH+s3HQAFvCcmzDdiTgKOaVqa0qXb6f/a/R2HaloGPq4WHogQPMfmpEkOl+tA==
X-Received: by 2002:a17:902:d48b:b0:215:b1e3:c051 with SMTP id d9443c01a7336-225e16b0fa3mr112060465ad.11.1742197310458;
        Mon, 17 Mar 2025 00:41:50 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4dabsm68863435ad.233.2025.03.17.00.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 00:41:50 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 17 Mar 2025 00:41:44 -0700
Subject: [PATCH] RISC-V: KVM: Teardown riscv specific bits after kvm_exit
MIME-Version: 1.0
Message-Id: <20250317-kvm_exit_fix-v1-1-aa5240c5dbd2@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIADfS12cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Mz3eyy3PjUisyS+LTMCl1z8+QUAzNjoxRzEwMloJaColSgMNi46Nj
 aWgCyH6qWXgAAAA==
X-Change-ID: 20250316-kvm_exit_fix-77cd0632d740
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_004151_449295_98A7BFC4 
X-CRM114-Status: UNSURE (   8.81  )
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

During a module removal, kvm_exit invokes arch specific disable
call which disables AIA. However, we invoke aia_exit before kvm_exit
resulting in the following warning. KVM kernel module can't be inserted
afterwards due to inconsistent state of IRQ.

[25469.031389] percpu IRQ 31 still enabled on CPU0!
[25469.031732] WARNING: CPU: 3 PID: 943 at kernel/irq/manage.c:2476 __free_percpu_irq+0xa2/0x150
[25469.031804] Modules linked in: kvm(-)
[25469.031848] CPU: 3 UID: 0 PID: 943 Comm: rmmod Not tainted 6.14.0-rc5-06947-g91c763118f47-dirty #2
[25469.031905] Hardware name: riscv-virtio,qemu (DT)
[25469.031928] epc : __free_percpu_irq+0xa2/0x150
[25469.031976]  ra : __free_percpu_irq+0xa2/0x150
[25469.032197] epc : ffffffff8007db1e ra : ffffffff8007db1e sp : ff2000000088bd50
[25469.032241]  gp : ffffffff8131cef8 tp : ff60000080b96400 t0 : ff2000000088baf8
[25469.032285]  t1 : fffffffffffffffc t2 : 5249207570637265 s0 : ff2000000088bd90
[25469.032329]  s1 : ff60000098b21080 a0 : 037d527a15eb4f00 a1 : 037d527a15eb4f00
[25469.032372]  a2 : 0000000000000023 a3 : 0000000000000001 a4 : ffffffff8122dbf8
[25469.032410]  a5 : 0000000000000fff a6 : 0000000000000000 a7 : ffffffff8122dc10
[25469.032448]  s2 : ff60000080c22eb0 s3 : 0000000200000022 s4 : 000000000000001f
[25469.032488]  s5 : ff60000080c22e00 s6 : ffffffff80c351c0 s7 : 0000000000000000
[25469.032582]  s8 : 0000000000000003 s9 : 000055556b7fb490 s10: 00007ffff0e12fa0
[25469.032621]  s11: 00007ffff0e13e9a t3 : ffffffff81354ac7 t4 : ffffffff81354ac7
[25469.032664]  t5 : ffffffff81354ac8 t6 : ffffffff81354ac7
[25469.032698] status: 0000000200000100 badaddr: ffffffff8007db1e cause: 0000000000000003
[25469.032738] [<ffffffff8007db1e>] __free_percpu_irq+0xa2/0x150
[25469.032797] [<ffffffff8007dbfc>] free_percpu_irq+0x30/0x5e
[25469.032856] [<ffffffff013a57dc>] kvm_riscv_aia_exit+0x40/0x42 [kvm]
[25469.033947] [<ffffffff013b4e82>] cleanup_module+0x10/0x32 [kvm]
[25469.035300] [<ffffffff8009b150>] __riscv_sys_delete_module+0x18e/0x1fc
[25469.035374] [<ffffffff8000c1ca>] syscall_handler+0x3a/0x46
[25469.035456] [<ffffffff809ec9a4>] do_trap_ecall_u+0x72/0x134
[25469.035536] [<ffffffff809f5e18>] handle_exception+0x148/0x156

Invoke aia_exit and other arch specific cleanup functions after kvm_exit
so that disable gets a chance to be called first before exit.

Fixes: 54e43320c2ba ("RISC-V: KVM: Initial skeletal support for AIA")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 1fa8be5ee509..4b24705dc63a 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -172,8 +172,8 @@ module_init(riscv_kvm_init);
 
 static void __exit riscv_kvm_exit(void)
 {
-	kvm_riscv_teardown();
-
 	kvm_exit();
+
+	kvm_riscv_teardown();
 }
 module_exit(riscv_kvm_exit);

---
base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
change-id: 20250316-kvm_exit_fix-77cd0632d740
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
