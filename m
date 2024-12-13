Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9FCE7717D
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gEEtGgScP1GU2pjs9Y9RA5tG5UFSqIrVxAK7JEMoNR0=; b=iZsV2JjOPsQCRb
	njTScSQq1YuwmD+ndX3cHPLigZv/wBYqn8815zlvQjFy3MHzIDxqHipzSiC40LtuARZ3OmN8Mrd6E
	myr83z20H6BsGw9vSK4RpMB5OrVazC03TG6CzRk0lJS3zJqHJSAP6vfP+ruH9TvuL/PRRnBZRL7EV
	/+xPD1IyYxn8LjjZGo8nvUjTYyWOLoNtpJ6pvdfX80E+6c//mF7dH5j+jEQ7QWrSUnX1lg/Gl8QLp
	LsdPaT7BVdlzvf/j7sOEtFPWuOgFqFN3BS4FlO+7vesGeipX4WwiFLl9nsQuskXRFp06EtfAgNOi0
	IkGm+DGa2As/CcIn4c3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7pC-00000004IuA-2HPq;
	Fri, 13 Dec 2024 15:43:30 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7p9-00000004ItU-1OT0
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 15:43:28 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-844bff5ba1dso137507739f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Dec 2024 07:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1734104605; x=1734709405; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iwjoP0Rbkuiwb4EhGyP5yHnBvkPf6hPIeiHA6s05heM=;
        b=Odq1G7fsyhWM3/Fy0rGiiQrgbyBSH/WsbJ0BYdksK/wGNoWWZUJaKKsUTO7h7eKO+h
         vrSGBiOUF1LkTLYB0OgqCVxx8iX96+S1Nnw4JuEN3447D5QCn34ksHCcOr+4xv95j9OZ
         aAwxAgqYEN1Sz2XNzb9nb7nDoOvFbW6dVUQr003YGfJPDX1QihcwG4zRkFFQTfxsJ/xE
         eW5R9IJ2Uu1bwfcekY9az5cUzPD5zWitpotlK5gqJo+7mlxq97oT79anYCPioEvbuQAz
         jnetIykDgJswGtK68/zAgxtok+z10vDPVL7zMjM8ol3g+OEHnmfkhrDgBO/2fnHxYewA
         7bFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734104605; x=1734709405;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwjoP0Rbkuiwb4EhGyP5yHnBvkPf6hPIeiHA6s05heM=;
        b=u9RbzPnXZYON+T9eTXnDFc+9108CknXbooqmFyeOoli4zskFoTh3HxKoiz3bGD0dwL
         CzFnKemkGyO/kjAxJUwiTwIkL3fL0SAbNOzeq0ISYILNYvXuWD3eT1D5XlMxDerq+XG9
         EfsgHeGcCrZqe4EtNMX811TuTyOUrYIu7tqja84xznpSEffLQu5yvptgPcbnfY4JK5xC
         Hm0gS5L9I9TNk+hEFIcRTxkrjbb+K7W68/XfjCOXaAvqDGucgfV4LJVnV40pScxSVyVS
         kOyQyLAOCJ9WmVgtHOW4rMd+p47uNk5FKexqmhZzmotAeigNFVk7Ib8TNwvvKvMyMogt
         NdLg==
X-Forwarded-Encrypted: i=1; AJvYcCWTDtXQ/beBUrgRwZNVsGinpJT6++XMfoLVWkQM3jrr0W9Gt2k3bA6aU8WLJ4ecn23DK6IFX0LxuDo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCVUa7vyQUNiuKZzg/mgJ7maUUVm6JvaENl9NhJjq+9z0gohJX
	G2Y8WfMMBwpvCVZcl6bYrqTY+gUHuo6mTCGiHPKQedfefDdyT7lkdOvnh78TIvzZtdRRYZ0oSPo
	7pqvND4/4p9C1ViwgPccFl5rCKdEZr9duSERrSw==
X-Gm-Gg: ASbGnctx7FrPcfuBhOT0YzigKVEUGiBMSQGs/pflBBDPzM+rULqCbzl3oOcKvzTFACo
	fxhjbW4u17LEPZSGeVxTDSHXauFPgUUIBUcnmKDw=
X-Google-Smtp-Source: AGHT+IHszYtma7y6OUpPC8sx00Gd9GpsiqMRXevKniZfSrxLywefwvvNPxXnHXUXuYGvWK0JHf7Ffw8UvhWyAl7zeRk=
X-Received: by 2002:a05:6e02:18cd:b0:3a7:e0e6:65a5 with SMTP id
 e9e14a558f8ab-3aff52a260cmr44535365ab.6.1734104605585; Fri, 13 Dec 2024
 07:43:25 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Dec 2024 21:13:14 +0530
Message-ID: <CAAhSdy35NO2fUrgER57qgOHRSZYbGLvmKDPjdfpXOP04C1AhMg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.13 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_074327_511359_05708659 
X-CRM114-Status: UNSURE (   5.93  )
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

Hi Paolo,

We have just one fix related to the HVIEN CSR update
for the 6.13 kernel.

Please pull.

Regards,
Anup

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.13-1

for you to fetch changes up to ea6398a5af81e3e7fb3da5d261694d479a321fd9:

  RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU overflow bit
(2024-12-06 18:42:38 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.13, take #1

- Replace csr_write() with csr_set() for HVIEN PMU overflow bit

----------------------------------------------------------------
Michael Neuling (1):
      RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU overflow bit

 arch/riscv/kvm/aia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
