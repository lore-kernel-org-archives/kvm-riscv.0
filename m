Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1528CCA5FA5
	for <kvm-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/nng1bb4Raqtos6MOFX/OC5Bm+3/qDakJo7JWtCHnac=; b=BboztdDqD8bR9w
	XI5W1Dcrllsz6PMMkQYvmTY3fll4sWZqzT9JG94tRAMlr9ERTI9v8FOXkc+6+77/ELSDaMHgIlDqO
	xwVZX2llHYKiX+Vi2/Syn9bdC+F2Urgg3U4uuLrAmkBGvy3cP4iG9a0acsmjOrjiFcm5fIxgLN4Re
	QXxL+5WHwinyFhOLKRDx64TMf0mvvFRtIa3fI9TAd5YWBGnR8HXfkIy1hhBZTZQa1KIAqhjqf99MH
	gh0ZIQ01M29TSs8LqnxXgEWzQJL5r02EI5oFGizx2/QNyqaSVoPdXrtOOzOvYvT5BA+VcPwkC9xHR
	dWdeqWBLu3WiwAWd+y5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBKD-000000080zN-1fWu;
	Thu, 01 Oct 2026 07:35:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBKB-000000080yo-3rwU
	for kvm-riscv@bombadil.infradead.org;
	Thu, 01 Oct 2026 07:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=b+RBOt3rS/J9etAr3asGin1fc499s7yddsi1unBuAEY=; b=OskP4YKJJ17aWr78hihypQLKoP
	AX5f1FXkOvszO65tVErY87sXPHfR+LU/Wl6QKx3qGC9NHUj15Kl9MgkSCjCj61KYkAOh7XEeomnpG
	nlnA8CQz/AqvB2nL2u6NHIzqDbRQUE4rM5acRIx6GVzXS+DftUWOKjiONL20LBgtrq3OvVSEhHozp
	D4fV2ZsgT+o/WqrKAY+5ZlUsLz5efEEGbDhyLT10RE4+3RB7UrOw71Q+fkKF8ZfG/37gikJ/mnxCi
	EU6XeRCCrc6PejsFXWtlSqy/P3dOp2UuUwPPEIbMYdNXMX4rJ6WMMrj7aGmHvhAnrRisD3jnnuRfb
	9nEiTpuA==;
Received: from mail-wm2-f12.google.com ([74.125.225.140])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCBK6-00000004gWY-41Ur
	for kvm-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 07:35:26 +0000
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso22402135e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 01 Oct 2026 00:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840119; x=1791444919;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b+RBOt3rS/J9etAr3asGin1fc499s7yddsi1unBuAEY=;
        b=lqYBjehnBvK3YCiH/v4EQxXZxcfK+mOq2GpYyBzkeaeGvWouheI6TBvktCLkFzlewM
         X8pdjNndWnnhERPRDpMl/7pSXK+wAGqRDqhKFSvFlrI9wOZGJEC+CQpnmAYUnM/h9Vyy
         g+lqWZAw1Z1UYcxsGzaL3hf/G+cDTW7EwQwIcfsW0qH1lrU461r2AwGhFYkwxcRHNIbm
         7T9/7IRFSxaSknuBC9DrxTjOSFpcUxzXVMC9+2K/nNQjVo1txwlMA5/yzWfgAxtrbOeU
         tWacCxJpDAoKDQK/U+45r7bFcNAez0i7yda4H0LZ515nZ5dBrhO3CL+Lr0+elonf7m7o
         zaPg==
X-Forwarded-Encrypted: i=1; AKwUvBxibJjo5KWyQbXJxR4m1eRQ5Myil7zyaDrh97duq7QmHqjHXbHoNl6nZzPvv7HMZ54YJyIppADN8W0=@lists.infradead.org
X-Gm-Message-State: AFuF++m9MzNAnHMpVdHgLnAQfil9vY1hZV763aUVfmS78Roaoc5Wu/rT
	SyNWkcChbaHm4gPfDXidXbAQLTvPIvKXyU2NKkBaFtvPsgLjLcw2HCMD
X-Gm-Gg: AYBFou0hEjTLII5okYAOEvEu3QmNxk0Wxzc5he91QrZzAtfCoJhn4gaHqukstR061y7
	S8JMYPuwYI/NjQyYHywKkYlCt8h9A6OV2woVAXIUno6tJx6CEbMEaAeCZPpYlyBHPqCs5Rl4KXA
	X5bxwGpqM1z4HULjB1jFikdXemtnjTCyNpqOUPoO9guRK3nclEfAU4wxpjPeq+ZC+2HRACxpWIq
	irAB0PKsGQGufra+Wz9/vB4zmfS6jFLqsXBZbhiE+ZfneKnT+WpTv5VagUIG+xs/AWf/ImFf+nu
	g40qLdSPbRTfqBglFq5Nv3xKbmWaBtUaXp/IAgfDbpr5fKOa1eyNWEmKkgs1S4rhyfJBDDvrILT
	EUBxdlSUd0iA2xjC6JcsSBTogBlNAY0Ka3p1dwgft1qHvfT04uunDVA9PejhmAafTaX/9iVTRlf
	YfavySR2cgiOqSAWIdM+i7sj4Z388BGYWlwIuNfd+AmMVVigbY9ULpjkZzLVViGQnnTGg8W/9JY
	+SAK+/wY16T3r1mR3//ziIDn5oKNBQ6zhlrLBGvLZlrpsA1fBmHTTrXMDcNaczPBsW8KQ+x9AGS
	SA==
X-Received: by 2002:a05:600c:c3db:20b0:4a0:37d:9e21 with SMTP id 5b1f17b1804b1-4a01affcedemr49892375e9.29.1790840119247;
        Thu, 01 Oct 2026 00:35:19 -0700 (PDT)
Received: from mac.fritz.box (p200300eee7049d00f14da2a424a76ad6.dip0.t-ipconnect.de. [2003:ee:e704:9d00:f14d:a2a4:24a7:6ad6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f922ac4sm45890045e9.6.2026.10.01.00.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:35:18 -0700 (PDT)
From: Stefan Butz <mail@butz.st>
Date: Thu, 01 Oct 2026 09:35:07 +0200
Subject: [PATCH] RISC-V: KVM: Don't write MMIO load result to x0
MIME-Version: 1.0
Message-Id: <20261001-b4-mmio_load_protect_x0-v1-1-90515d86f201@butz.st>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrA1kgnHhVUoJMZnUkWokSYsg3
 t20Lj947z8gU2LKMDQHJPpy5rhWYNuAm+z6IsG+GpRUPUqJYuzEsnA072i92VIs5IrZpdBBB4d
 IVisL9b0lCrz/y4/n7fwZ57r+5eA8L7Cnm3N7AAAA
X-Change-ID: 20261001-b4-mmio_load_protect_x0-5f5fc11ea52a
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>, 
 Yifei Jiang <jiangyifei@huawei.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Stefan Butz <mail@butz.st>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1790840118; l=1161;
 i=mail@butz.st; h=from:subject:message-id;
 bh=9Ow88ngY/eToV6q2OOUEvhdkMKoiN6ZQlSDSuhIxvjU=;
 b=U1NIU0lHAAAAAQAAAZcAAAAHc3NoLXJzYQAAAAMBAAEAAAGBAOJW8yHG2FdKcC8jiWoQyd2Z6
 SNHh+aJB0RLkH7BFF7Yy7MymfE5UJE2mmoucIa3HiNQdlVZjgqLY7wph/VSM4kniDO57IG9Q9jN
 x96oOAzzWWJEVrh8vlxRGXatNy8ywcO9WExvzLop5s2ddP08f0Wrzn/55mpqoLJyoKaIbk10kxz
 JW1GONHT8nsNvBpVB2lnzA2jhv7DC79UlHzA98+sp8eX6kmUips+9LpTJLDeVna8f/vwkU708PI
 Qxt/5nhmFXKj/su/CMFivCLHckdmMOem/4UNoTyRcAbcoFQ9WWyYHvAD/bRuYZVEA2hfoBEQVu2
 FGHdG/OimvbT/GseVmWjiw7WV9HUOJJawVmfoTEJynX9BbV+VNMKZVpW5YaAaps6/KOC7V2bM7P
 hvORUmj3b8eUr418GYC3M4rLJtrj6Vu2cUyTV9Q5dvq9Lg2TIj/jpbEWpOqn2FSGkQcLvcDksNk
 jOSGmdG4h+OJ3vbGrva5UCJF/KIyuV4ozlSU7awAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAZ
 QAAAAMcnNhLXNoYTItNTEyAAABgNFm4MOaEyzELZNBwbPaVz9/x1KmXNjfSW2SxHyCKpy6XafGX
 BCXcTrwCvg1f/y/bHmlxQanPGKYZp46WedmvlcguZHU4ivCQiw5rnXtH9OxaKHdox/dRhSlUHWj
 SnOPY5e79+yrKjpMK/uzUY16o6I4aIusq/3qQ+mazCVEmx8t3Gt9tIo/y4swzu61Zze/LmMDIjH
 R4pLtYxuWChtgj0HgOU7+oA1yIKWYY31cq4NNXsBDtzVsAxKV/BvmX49yfLB3iqN6oN31Y4srrc
 5R+hyD54KYZJ1dx6toBBzUnNMtsCaox4R8hIBYAJ04wQ8qnWez7ie4GbLSJu2h1Y/kEqupriFHx
 Yz2fv0TxpEdzXtw8P4pNHAQ0BwVnszRLvbN0ZgNngYbEgdombqJAbfZ2yw9kzRCdiik+NDxCHsg
 4sdBkUV7/mU+ifx+ZPbsOlkqDb7cvzm+JNnmbH7xaIMoGelqUVTMkTkcVRACC1R67RkpnITYeXV
 6CnNZONNm2anAHA==
X-Developer-Key: i=mail@butz.st; a=openssh;
 fpr=SHA256:jcZFBs39daoQJIontO/rJaVachWp/oqTbhNpQk8+REQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_083524_546917_9376D290 
X-CRM114-Status: GOOD (  10.60  )
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

An MMIO load with rd=x0 writes the result into guest_context.zero,
which is never cleared, so later emulated reads of x0 return garbage.

Fixes: 9f7013265112 ("RISC-V: KVM: Handle MMIO exits for VCPU")

Signed-off-by: Stefan Butz <mail@butz.st>
---
An MMIO load with rd=x0 writes the result into guest_context.zero,
which is never cleared, so later emulated reads of x0 return garbage.
---
 arch/riscv/kvm/vcpu_insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index adbbb59a0f36..2a8dc2b88ba8 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -647,7 +647,7 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	vcpu->arch.mmio_decode.return_handled = 1;
 	insn = vcpu->arch.mmio_decode.insn;
 
-	if (run->mmio.is_write)
+	if (run->mmio.is_write || !((insn >> SH_RD) & MASK_RX))
 		goto done;
 
 	len = vcpu->arch.mmio_decode.len;

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20261001-b4-mmio_load_protect_x0-5f5fc11ea52a

Best regards,
--  
Stefan Butz <mail@butz.st>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
