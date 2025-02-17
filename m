Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A47C021AA
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 17:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:CC:To:Message-ID:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VaoRpqqpWqXpR1X5Za8jO4xU01mgKhis3aalco13tdc=; b=05/YlwopNctW1x
	uDO4BgXKYBlFSF+fsedDklW9+XFBtk+drsBzBo9smYoj7VbrHX35UbKos0Tmp7sYfWbs+ZQxHdBsR
	oknpuapT+q671QBd1tI4/hEGtNQu9eNjeQI1Kj1Ep4ZcSquOVwrkK78leyzonhkow7vAuG2Aw+EOC
	4WtQqrZHMmsLTr3UEIGB+AvYCqw5/ncnCWH5RUHIOHNYoZP4lXHXGfdVnloLepW6+KsM23qCDlns7
	V7nTa1QckLvoxoENj8FjFpyciD0aMkdHrBlWkD/1tgWKiaUTu+3MSHjiVrqyQHsoBAXqMc7wUR+4c
	cVs6rLI2HGmI8JisOQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4ln-00000005QXU-28LS;
	Mon, 17 Feb 2025 17:18:59 +0000
Received: from mta-mtl-006.bell.net ([209.71.208.28] helo=cmx-mtlrgo001.bell.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3aE-00000005Bru-1GcN
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 16:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sympatico.ca; s=selector1; t=1739808178; 
        bh=41DYd8S5nzPKADDvgmNVKMBye2mp3t96d0S4S/5x/MU=;
        h=Date:From:Message-ID:To:Subject:In-Reply-To:References:MIME-Version:Content-Type;
        b=pILx/D3EpeSsJ+lb7KhSjZeQ3KR6t9qjmcXgy0mK4a7p2CFclOXioEjjRQVThIbml2yNRPvuBj4/pbvf0w+BOlmovODdMlq7Lh8vQBClU6o9FXWw2osIHl/pdWTCK0EgUPhryYmQAbtC2QeEU7HRnRCTmuCl1sYsxEN3roY1709h+dRvX9tVVQrz5ELFDl1/aRS3ug7M2/UxcB2kF/lecxPAN7Bhl1a9CzZBIFktyYarVJLkjAOjIQx+LUfxTUczkS84Vu9LzFo+ezwhSZjNpc1VKd3r3s9J9Xb/6zMiA9ax+GuxdaZAj9BJmbBU9m4aS9DTwYmhlQWcluwzYcsvvw==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-Originating-IP: [76.71.36.239]
X-RG-Env-Sender: al.dunsmuir@sympatico.ca
X-RG-Rigid: 67ACA5AF01009087
X-RazorGate-Vade: dmFkZTGMu6JuLVqLuz3zvC7c6OKmmoJx/rp/Y62QFXTbJQCSvND99pzidzTNP0FoNoeT+DVV8xqc/cEi0E1ntBW/hE4KCN6Y5/Ni7BTyiox9QjrVemw03MswMXHZpvAvsWBAkOZ3G6Zz7VLWHE9aDveciqCfBYF1iLLPcu30qskWnCtVh42odawXvEiks5/HOlebHKhQNnKlTJU1BEFwS519tsIPbAD0MwH5R9jHvLjFUFsHR6FdH6m44PlkEDlLcCW2r+/aueZlns20RoZH8enOhYvFxpVtXKdzuWPnhIONQOnkInmckYWGZ1lwu5jJ+PYbQTgR5kj9Vtui1jnZ/Np9zkU+ldnZD5K6ITn+XVjpSCxzNzCpwX23nGIrg+5S75VC+BkRpfAMbblt78BjS+84cxt16e2PHfT6T5iqOz2/7q6UnrAJ7Fq2pvjqJG3D4k0hrmBFudt0e6xH/aUsN/TQJt1P69E2DKWgIr+VDrtu9nP9jAF0PesKZSHNbB4w3Ho/wZScR4vp/K4LKriQfT8+HxRmp6RrX+4SOYiihZ/24VdXY9x4EjTPn2R4LX6e7bloKkykLD1Rp+mzc5GDxZz3WWVNmcCM0IMEdYUbDhKPsIn7VvSTHRWZz1Aw73BXQSd9YgVq+H1vf5IiY2LRxNlRdF/wS+rq6PUgD5mbNAxFAIQFbA
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from bucky.alba.lan (76.71.36.239) by cmx-mtlrgo001.bell.net (authenticated as al.dunsmuir@sympatico.ca)
        id 67ACA5AF01009087; Mon, 17 Feb 2025 11:02:15 -0500
Date: Mon, 17 Feb 2025 11:02:15 -0500
From: Al Dunsmuir <al.dunsmuir@sympatico.ca>
Message-ID: <1972812751.20250217110215@sympatico.ca>
To: Alexandru Elisei <alexandru.elisei@arm.com>, 
 Andrew Jones <andrew.jones@linux.dev>
CC: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, 
 david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
 kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
 kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, will@kernel.org, 
 julien.thierry.kdev@gmail.com, maz@kernel.org, oliver.upton@linux.dev, 
 suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
 andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 03/18] scripts: Refuse to run the tests if not configured for qemu
In-Reply-To: <Z6o/rbweZttGReir@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com> 
  <20250120164316.31473-4-alexandru.elisei@arm.com>
  <20250121-45faf6a9a9681c7c9ece5f44@orel> <Z6nX8YC8ZX9jFiLb@arm.com>
  <20250210-640ff37c16a0dbccb69f08ea@orel> <Z6o/rbweZttGReir@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_080258_563925_AD8C2E3D 
X-CRM114-Status: GOOD (  30.54  )
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

Hello Alexandru,

On Monday, February 10, 2025, 1:04:29 PM, you wrote:

> Hi Drew,

> On Mon, Feb 10, 2025 at 02:56:25PM +0100, Andrew Jones wrote:
>> On Mon, Feb 10, 2025 at 10:41:53AM +0000, Alexandru Elisei wrote:
>> > Hi Drew,
>> > 
>> > On Tue, Jan 21, 2025 at 03:48:55PM +0100, Andrew Jones wrote:
>> > > On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
>> > <snip>
>> > > > ---
>> > > >  arm/efi/run             | 8 ++++++++
>> > > >  arm/run                 | 9 +++++++++
>> > > >  run_tests.sh            | 8 ++++++++
>> > > >  scripts/mkstandalone.sh | 8 ++++++++
>> > > >  4 files changed, 33 insertions(+)
>> > <snip>
>> > > > +case "$TARGET" in
>> > > > +qemu)
>> > > > +    ;;
>> > > > +*)
>> > > > +    echo "'$TARGET' not supported for standlone tests"
>> > > > +    exit 2
>> > > > +esac
>> > > 
>> > > I think we could put the check in a function in scripts/arch-run.bash and
>> > > just use the same error message for all cases.
>> > 
>> > Coming back to the series.
>> > 
>> > arm/efi/run and arm/run source scripts/arch-run.bash; run_tests.sh and
>> > scripts/mkstandalone.sh don't source scripts/arch-run.bash. There doesn't
>> > seem to be a common file that is sourced by all of them.
>> 
>> scripts/mkstandalone.sh uses arch-run.bash, see generate_test().

> Are you referring to this bit:

> generate_test ()
> {
>         <snip>
>         (echo "#!/usr/bin/env bash"
>          cat scripts/arch-run.bash "$TEST_DIR/run")

> I think scripts/arch-run.bash would need to be sourced for any functions defined
> there to be usable in mkstandalone.sh.

> What I was thinking is something like this:

> if ! vmm_supported $TARGET; then
>         echo "$0 does not support '$TARGET'"
>         exit 2
> fi

> Were you thinking of something else?

> I think mkstandalone should error at the top level (when you do make
> standalone), and not rely on the individual scripts to error if the VMM is
> not supported. That's because I think creating the test files, booting a
> machine and copying the files only to find out that kvm-unit-tests was
> misconfigured is a pretty suboptimal experience.

>> run_tests.sh doesn't, but I'm not sure it needs to validate TARGET
>> since it can leave that to the lower-level scripts.

> I put the check in arm/run, and removed it from run_tests.sh, and this is
> what I got:

> $ ./run_tests.sh selftest-setup
> SKIP selftest-setup (./arm/run does not supported 'kvmtool')

> which looks good to me.

Grammar nit:  This should be
SKIP selftest-setup (./arm/run does not support 'kvmtool')

Al

>> 
>> > 
>> > How about creating a new file in scripts (vmm.bash?) with only this
>> > function?
>> 
>> If we need a new file, then we can add one, but I'd try using
>> arch-run.bash or common.bash first.

> common.bash seems to work (and the name fits), so I'll give that a go.

> Thanks,
> Alex



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
