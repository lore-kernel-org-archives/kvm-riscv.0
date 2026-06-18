Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE50DCD98F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 07:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRKsCny5Z5A+tv07gp5VobZbykUT+BcWeKW4T333nas=; b=SFvHvM4VliT0YN
	3E5AmXVs9fAL4RowoM3SQSRVNKh2z+HVWbgwNvT5dWYk7RfY/yMcMOVAcWC5FxAC2G4/rKigg8pR9
	+mjy0IkUpQucgxWehS6Ty3EWJ2Giq6Atkhod95GiKU6p4SrIcxX7Jz6ksqSCw6tmnveKFO9K9jsTT
	5BbxNaaqKFClEPfyqQqVsHwKBVIU7LEfIYsT6Ek+gw8DV7jLQHSVMGrN1k9s6hBFC9nypau8fi6N/
	zLa0jrLhhsKn8FAq3HVmTpLxQ3fEkIdzdx7s/hVheZN/7rOuWl8nfemeMgyU9leEP8U9WFhNZb+ih
	cX2iy193KIdccBXJsBuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Dp-00000000lV2-2Ufc;
	Thu, 18 Jun 2026 07:31:33 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Dm-00000000lUO-1yFT
	for kvm-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 07:31:32 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1384eb94d20so1628073c88.1
        for <kvm-riscv@lists.infradead.org>; Thu, 18 Jun 2026 00:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781767889; x=1782372689; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VSCBYXCt65DixNVaZdVjTYa+6C9GG/pjQw7EWmlt+FE=;
        b=PORPBm9dJz07bwi1xn95JhRWFB33PimiOQcZo006qwJD5z4FdaFULsVLItqqmuxTar
         F7QtJtaIN6EmtUbCoKrdJNFy4sQintoYjEhhyrklAW6fOsu+R4aSwd+TrlWeLrjp+D4y
         ix6vlWSiUHeBkAfg7xdOq83MRjWJVR5IplRORBjN6kc8g6MVUhBpBYzYgzaOCoK4OET5
         6zFS8TqMSScNwFjl9rk5VbVKEajXc/2eV/aHwvG2Xz1MBdPXS57jFSmZsZdit2rnrIR8
         uFnsI86xdsJgOpyfye3iGq6XjLU7q+LmDpRB3OQ+oF7IHVm6vzSAHgPJaejj7iT4YjLX
         qAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781767889; x=1782372689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSCBYXCt65DixNVaZdVjTYa+6C9GG/pjQw7EWmlt+FE=;
        b=CRDjEO4qTBVBvIqg2yWeoOomqaBPmgwc8iA4tffiU/phWBrrT2y0ZSGG/QKuPPITSI
         /qGnRSPeYZCRNBQmhgA3iatuPrBgZlPSPYdmHWxkh9QcZjSAye+z3onuOxnhGzyJ50bF
         9tkZDyYUtZpLLXDC3JaxvNieFzAUpjUNFplY0pb2yGg2mPB4BdF2rJE8dVJTJfrpfdW5
         jaYAH28SnDdQ+Yc5ImuH+7TG9XwfwxwN5vcpVoCf1lCKm8hKpUob0HBNu3TuqCgJeXtq
         REhYr2fc4DoVXV1cC0+FFlq+x/VJjdIeByqAjqeBhQz+gfV/saVUuFntXopi24SSxkN4
         3XZw==
X-Forwarded-Encrypted: i=1; AFNElJ/eV4vncZGdJBnnf3FyU6SJhYbGO+w+aHBWh8yPPX6LbClRpf+ZUUm+TYsqhPPJZfFvG5T2z1sS4hk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjyLoR5jBL8wgDb0E72QTOCl8TernkcJ6DekFaXruwRapY1NrK
	R3YHdXaAzL46+80xWMxCOPKJ/nc8D+2lMJGsUwGj+XEUh/RnJBWuDM+P
X-Gm-Gg: AfdE7cnhrCFSBf4QyZH9wezQcxviafckMxP/5E9Ps+kAMMgNIeEBdQb4s3rGD20T0aX
	LyjT1t2nYUbHH5njPBesvNA4XYIbKRJwBTzKQ8ZhqvnKUQwgBk60C+xooIsgh8myTBVzHpCxzFs
	Ohq0TH/O2peJIrFRCV3Fbwn09pvE1NrW1k0GviJnW/DPalrmGDQDEtasWo03bh+k/5TKxDbxe2D
	cXekICY0dduUVFqHHthpRaE0Dd4cafTUAQcqZKnodkwz7xhEDQC6PGWnFCFboAHjPVCraa0TRHB
	usjBRGH1c+1Cn/d0Mn9x9MSJYIa188TInJbtpHKYoSnZAKKDJU6v+mJNtDHVbR2Q0Q0UKUXKWbq
	9mjQZhvLCJtBX11sdMPP5cY+4qmpg6PIGaFKWQA4lPCjNBndSr2Ys/+qEgvleFqAdpMxWIAmkPK
	zr
X-Received: by 2002:a05:7301:1286:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-30bf0a2bcf7mr1930579eec.34.1781767888969;
        Thu, 18 Jun 2026 00:31:28 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm7319764eec.22.2026.06.18.00.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:31:28 -0700 (PDT)
Date: Thu, 18 Jun 2026 00:31:26 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 04/16] riscv: kprobes: Use generated instruction headers
Message-ID: <ajOezhejx7PcOw_x@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
 <87jys5egum.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jys5egum.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_003130_511391_393B7AB3 
X-CRM114-Status: GOOD (  15.62  )
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

On Thu, Jun 11, 2026 at 08:22:41AM +0200, Nam Cao wrote:
> Charlie Jenkins via B4 Relay
> <devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
> > This was again verified by checking all 32-bit values for each of these
> > functions and checking that the two version have the same behavior.
> 
> Your checking is missing some cases. branch instructions and c.jr are
> broken.
> 
> Btw, any chance that check can be added as a new kunit test case? I
> wrote the CONFIG_RISCV_KPROBES_KUNIT, but that only tests some values.

Okay I looked back over my test cases and realized my mistakes. I was
iterating through all possible 32-bit values and passing them into the
new simulate_* functions and comparing the register state to the old
simulate_* instructions. I missed the _pc + addr bug because the _pc
value I was using was 0. I missed the simulate_c_jr ra bug because I was
not checking ra.


Since I was checking against the previous version it's not possible to
do a straight one-to-one conversion to the kunit. I think it might be
possible to do something similar but I will need to mess with that to
determine a good way of doing it.

- Charlie

> 
> Nam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
