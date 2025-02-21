Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFECC021B6
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JxRP/bXOqhvg2gRKxS59N5iHfU0e+SNrLmZxqQ2mIBE=; b=nYtbEFxapcRISR
	O6VwnUwuFE0QtjlCnTrzHksFVkZx+m1vdF2qetcwvdt3AO26L7lQ3SYTLAkhWiRhjaMWXYLtdR0I8
	XsKsPBrvK6UAQJA9UHoTOLqXnQZVXBe1J55fROUeiCUfeyzYOQ8BU4vP+CQ/NJHDq0OtuXvRkwP4A
	aHk/aG0Rx9vM2zn3oMhcGo1kVVXJwTQqwfh1K3b/1+44IZ1fGWTp+L5KqQq8QLqqmDLnq/ISgALqA
	PDFnkXbWG9K5Sp/BGLpDsJbuilyF+Ucu5nm8QWq3u7faNt9UVBdcTywic01y1cMpNvFP/Uas8lgeM
	97oX+DL6LUjRXKnrl5fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWY3-00000006KF5-04VU;
	Fri, 21 Feb 2025 17:10:47 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWVG-00000006JQ1-2mYA
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 17:07:56 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d1a428471fso17586905ab.2
        for <kvm-riscv@lists.infradead.org>; Fri, 21 Feb 2025 09:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1740157673; x=1740762473; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CBn06bjrraG0RKUpLcfzoygq710m6p9nGy5k5/eorm8=;
        b=I+xgvbdP4YP/D+RnYcq+ettxj98SVmNzn0jp0nqHPVjEFWSb3f448nZ+VBV5Gi9NV7
         9ggqMZnLpPQdHh08LfNvHVLMQeSWhuMWmbb5iS+R6h9Gnjn5LTo2X8P4pKPZXZ/kpC/U
         010JJcWuASdQYn4hcL+ZGQn3AvQPX+CVGxM6mUp6j7BzcTx7WvMOIOlSboSjc9OZHDbk
         I4r0+l/1qjDm9pLk6dSRtxSoawNmsZQBBsOiraSjFgv1phxATHKhaBkrDLweSJ44095T
         sF41iIylHC0D5KHd+ACYp0tC9DGcqm7AlqnWep0I0Qcdu2rGBMiNJXDzyZH+KiDIHYjS
         1JVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740157673; x=1740762473;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CBn06bjrraG0RKUpLcfzoygq710m6p9nGy5k5/eorm8=;
        b=ZF2KoTHDkhukYltpDLVKAxFpkc9BV6Bf4Fzprim4Q3FvrXtxdlsJmWkWHEHwlSza69
         1SIyS/Vrp7SFtZav+vRbDcBpVETBFDkBw0dKmYjxFeP4/v/CwkMp7TD8iItB2/6gXMkq
         AtCdhZ4qjkRoP+Ua1Od5X1EAS8rzNvQpCmpfvmJR/revEoDLSMDbkMlWvBqzunhqxIsZ
         bjghZhj7wKlI1iODcBtj/zuAeKVJ8GrNJjqNAvZ7pLqw2HRoYnRnsGeapeBQvk+eZE8u
         xRN9xQPBK+jqsQ/GchufBVPx/C41tub/Vo8V0JNkaFjS26zol+LoZLSa38r9e87piibh
         xACw==
X-Forwarded-Encrypted: i=1; AJvYcCXUmKJsxPumdqmT06jsseIjzVg4aNjouKjpVedzjyS2lfHKK9lA5QSQSgOVoPQa+Qyp/9MK178/Z1s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsv6GAY03qvFhFzuyEKdmYeorCcEwxyuGB5h96bPRi9idrPFmd
	5sdra6fVEqqILwfL+vWemlS2lF7dquBqwcWaBcoETUfmg32gw04gYOgxUo4kDKySlM3BWEEc068
	cX9o4/lF+RKhZCToPpHD4GwdI697MzbLi9VUdZw==
X-Gm-Gg: ASbGnctoSq1XDEN47mN+ozh0Z3Jzxvz+AWLNZVLLHknOBYeJYWOyt+BWaLARKL9NEqK
	rQx3QiVwdfIRvrDMSZys33nPt3m5xFR0dtph+NNLVO4KoODyd26jdoHGdm4py0BT7kXS4Z8hQqy
	G9vutZsOs+
X-Google-Smtp-Source: AGHT+IGRxDMuamLyFFZPWt36k9Xy7MsZrVjV0LfEUgQJUkul59kYRBL0tFtgmbSG0/iAJTc+eQ8iAXGUsji68pO/JiE=
X-Received: by 2002:a05:6e02:1a67:b0:3d0:3851:c3cc with SMTP id
 e9e14a558f8ab-3d2caf19e17mr41489945ab.16.1740157673541; Fri, 21 Feb 2025
 09:07:53 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Feb 2025 22:37:42 +0530
X-Gm-Features: AWEUYZlRnrCyat69poKdznrr9iSVNpvCW9gvd_ViAEmY7eEE9K8GiF7Y3M7YyjA
Message-ID: <CAAhSdy0Wo4hQ=gnhpJGU-khA4g-0VkfkMECDjnAsq4Fg6xfWjw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.14 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_090754_713489_0E1FAB6D 
X-CRM114-Status: UNSURE (   5.37  )
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

We have a bunch of SBI related fixes and one fix to remove
a redundant vcpu kick for the 6.14 kernel.

Please pull.

Regards,
Anup

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.14-1

for you to fetch changes up to d252435aca44d647d57b84de5108556f9c97614a:

  riscv: KVM: Remove unnecessary vcpu kick (2025-02-21 17:27:32 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.14, take #1

- Fix hart status check in SBI HSM extension
- Fix hart suspend_type usage in SBI HSM extension
- Fix error returned by SBI IPI and TIME extensions for
  unsupported function IDs
- Fix suspend_type usage in SBI SUSP extension
- Remove unnecessary vcpu kick after injecting interrupt
  via IMSIC guest file

----------------------------------------------------------------
Andrew Jones (5):
      riscv: KVM: Fix hart suspend status check
      riscv: KVM: Fix hart suspend_type use
      riscv: KVM: Fix SBI IPI error generation
      riscv: KVM: Fix SBI TIME error generation
      riscv: KVM: Fix SBI sleep_type use

BillXiang (1):
      riscv: KVM: Remove unnecessary vcpu kick

 arch/riscv/kvm/aia_imsic.c        |  1 -
 arch/riscv/kvm/vcpu_sbi_hsm.c     | 11 ++++++-----
 arch/riscv/kvm/vcpu_sbi_replace.c | 15 ++++++++++++---
 arch/riscv/kvm/vcpu_sbi_system.c  |  3 ++-
 4 files changed, 20 insertions(+), 10 deletions(-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
