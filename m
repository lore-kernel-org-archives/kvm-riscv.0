Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE6AC3600C
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQf23RG01o/14OuP355QZHR+aaqnR0H+RW38hy9z77s=; b=AIuSoZ8I5R5q6m
	Yv0zSQrtw1r29qqUmjW8iIOBWEx2TZVIe9l1oC5n5bCvlmfy0rCEMMN4Err2KUOSmQpzLHCtP/oNk
	fVTN4fDvUrFt6azjYD6DI+biJ0mmFiQkivdZt8xCkoQRrxdHhUNV73OYrDyUSV/yZttq+bd9R+RkQ
	3grKi/awr9fQEcgBPPFW8a/6yOyjL+t6by7x0Lhwsb1Ru0w6hn9+FmgLeQwZMMpVpZAaxoQcoS/U+
	98hHUvLDHfvhwY9HyKCbyXlbYyZIWDD+fXWizbH9R7bIOIEp54iuAabtE1VBCrLb7H7EubQYfW7u0
	QlB/CjFmyVMmajBwQWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twk6M-00000003Z7A-1DO3;
	Mon, 24 Mar 2025 15:52:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twk5x-00000003Z3g-0RT4
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 15:52:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so32354165e9.3
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Mar 2025 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742831527; x=1743436327; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfspRdXGlgq6NyzVTJZAgVrhAb+j3MeBFls5zV5sjbk=;
        b=PmES9LJwq5dCfX/BtiI8bEfwZOk5FJYQ885XoT9Gcu8kbjNW1UUc0oICaluxYETywb
         68pv2SJaNO8oDIsh+5PV5mkKDjs5pUBJ4tUfUtaEWzB3udjv0hPPwxoL+Ej3gw/hQ2Yu
         kPqIT72y+4cJVZSzuuVshBevnPRKCHjpxCAGyY3Emp7vFWj0+BCTmxOnEa41RvG+5ceA
         +X4PToDec7pQm8fc34KJm6Sq72Rz9KpIpEa9Rp2rOohaGDiKKvFfFeA0gmSzlaYStS6O
         PfTiK82UNnso47YkXZMhsAvrNz20Jt/eTq6/n0PAFhW1ShFMF12fQlQdu3rmokQrknJv
         VCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742831527; x=1743436327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfspRdXGlgq6NyzVTJZAgVrhAb+j3MeBFls5zV5sjbk=;
        b=KOzXTRZU5q25mQlLeerp94+/UiY2lNi2E5CMf2m5XNCUZMljBeIhvYIVSlHBS0K+0G
         7J3D7a1Go/FKwlwlybv60/jPAG1subXqxcp3zVYa3g8x/NAI2dLeP8r4cgd6UblTZrLu
         5PfKxNyhWVYskwxqV5G8C4O0/EnaIxFVXwZWgbKdPUCw1t4sQTibKogTkBG9rScy6hj3
         RzDhBPKUCwZZ+ZJR8dsljrTIrkhAQJv95Z4zXrflYGiXUjk5M5GatYTiI0x5EiC3MqHQ
         b5U54WgpJuOsuQMC5OuoGOAuy7gfa06w9rV0BHg3UYgVrnEC/3rcYxOTGnsw/fO2t0J+
         k2YA==
X-Forwarded-Encrypted: i=1; AJvYcCXyVoqlJjh4UKC9v4sXGDDCrZ99ANxREHWBDdBWbdRb3om4MX9QnVHeCMbeF+9CpnIBT6BUjMrOTSg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnwyI79JhWKiWWGTPZSV3uJkkzOBNA7j3b6C+bASOCdcC+0ZOW
	S2y8sJChjXXobXuN58k7EXxKkppovnakP/zL1odlChUOGD564Qdy7eBqvTV7bQl7HRCeZbPMpnV
	NrIE=
X-Gm-Gg: ASbGnct+DZ+w47eYOZP7hlgebZuomXTi77utvlUpowUJiKzDBGqMdy2RhLkPRH83IQA
	q31rxQy20qSuvvCgnWhz40g6Jo9PQ7opcgY0InQN57wipJbGTRiT4xfOG6g4TKC9eli7JLHvy4a
	TRqcsk5x+3AfE0iFgd3mFzdGy6e+UzmZPVSmX9R3U8ePgOkMNyUQlKpDkz69RyFvc+zvYmG8vFQ
	9ZS4ukQ1x88le9Xxml1Zjz0iK0sOBCAHbunY+4qw6ppmLoaPCpgye+509FqR3+DaF0FAVkZiPRW
	gDpQiMqnhhjq8xqKTmEXOHPj5Njc5WoICInYWa+XPZo=
X-Google-Smtp-Source: AGHT+IFl7nFmYn4ImJin0UE8VO9TEBa7A4QjUDf+jR+LnIW0MqNGIXU4E97G8J6fG8YpTpqXzsYFRg==
X-Received: by 2002:a05:600c:574b:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-43d5703e686mr82814625e9.7.1742831527103;
        Mon, 24 Mar 2025 08:52:07 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f556basm173837045e9.17.2025.03.24.08.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:52:06 -0700 (PDT)
Date: Mon, 24 Mar 2025 15:52:05 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, eric.auger@redhat.com,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 4/5] configure: Add --qemu-cpu option
Message-ID: <20250324155205.GC1844993@myrica>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-6-jean-philippe@linaro.org>
 <20250322-91a8125ad8651b24246e5799@orel>
 <Z9_tg6WhKvIJtBai@raptor>
 <20250324-5d22d8ad79a9db37b1cf6961@orel>
 <Z-E2v1sKiPG_pt9x@raptor>
 <20250324-37628351a72ca339819b528d@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250324-37628351a72ca339819b528d@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_085209_149478_6D7F0656 
X-CRM114-Status: GOOD (  30.90  )
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

On Mon, Mar 24, 2025 at 02:13:13PM +0100, Andrew Jones wrote:
> On Mon, Mar 24, 2025 at 10:41:03AM +0000, Alexandru Elisei wrote:
> > Hi Drew,
> > 
> > On Mon, Mar 24, 2025 at 09:19:27AM +0100, Andrew Jones wrote:
> > > On Sun, Mar 23, 2025 at 11:16:19AM +0000, Alexandru Elisei wrote:
> > > ...
> > > > > > +if [ -z "$qemu_cpu" ]; then
> > > > > > +	if ( [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ] ) &&
> > > > > > +	   ( [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ] ); then
> > > > > > +		qemu_cpu="host"
> > > > > >  		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> > > > > > -			processor+=",aarch64=off"
> > > > > > +			qemu_cpu+=",aarch64=off"
> > > > > >  		fi
> > > > > > +	elif [ "$ARCH" = "arm64" ]; then
> > > > > > +		qemu_cpu="cortex-a57"
> > > > > > +	else
> > > > > > +		qemu_cpu="cortex-a15"
> > > > > 
> > > > > configure could set this in config.mak as DEFAULT_PROCESSOR, avoiding the
> > > > > need to duplicate it here.
> > > > 
> > > > That was my first instinct too, having the default value in config.mak seemed
> > > > like the correct solution.
> > > > 
> > > > But the problem with this is that the default -cpu type depends on -accel (set
> > > > via unittests.cfg or as an environment variable), host and test architecture
> > > > combination. All of these variables are known only at runtime.
> > > > 
> > > > Let's say we have DEFAULT_QEMU_CPU=cortex-a57 in config.mak. If we keep the
> > > > above heuristic, arm/run will override it with host,aarch64=off. IMO, having it
> > > > in config.mak, but arm/run using it only under certain conditions is worse than
> > > > not having it at all. arm/run choosing the default value **all the time** is at
> > > > least consistent.
> > > 
> > > I think having 'DEFAULT' in the name implies that it will only be used if
> > > there's nothing better, and we don't require everything in config.mak to
> > > be used (there's even some s390x-specific stuff in there for all
> > > architectures...)
> > 
> > I'm still leaning towards having the default value and the heuristics for
> > when to pick it in one place ($ARCH/run) as being more convenient, but I
> > can certainly see your point of view.
> 
> I wouldn't mind it only being in $ARCH/run, but this series adds the same
> logic to $ARCH/run and to ./configure. I think an additional, potentially
> unused, variable in config.mak is better than code duplication.

I agree with this. However the next version ends up replacing both
cortex-* types here with "max", so we won't need to pass these values in
the end. The "processor" selection in configure will only be used by the
Makefile for the compiler flag.

Thanks,
Jean

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
