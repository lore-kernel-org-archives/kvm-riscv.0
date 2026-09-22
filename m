Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96478C982FA
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 08:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhIh+fZLDnWOR+y7BBxIvBajxNolxsBhqT8Ny2vAuo4=; b=akofm/ZPHy1IVL
	NbY7bC1Mx0gHhBgMFW0fNYx2G8WX9rPFFL+3m0+PrZgmFQlG5meACSdYZPbqeNvrg8bK2604z1vVg
	k5kFsu7S5LBqdWgaJiDAgaEMECZYlpYMz3qNopzkSOfXvqynCPQd+nPgVoZlcKjnXE1WLaBFpM6Nf
	IZSgdjXTKp+IlQPG4VFYiu1O6VQZzB8rP81ZSbAKO9UqHgeIzS+grzF4PwS06Ku8Lb82XfPO5p37V
	tAYMqJa5xMnUXTcv1/jV2Zi3c/E1ZbYJNZhAtVe1XdPJycJahiP2OC69vPYLfX4lWH9UX++kyG4mS
	c+WnIG/WkC4sqvk8h/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vWd-00000004cEA-1N82;
	Tue, 22 Sep 2026 08:06:51 +0000
Received: from smtpout6.mo540.mail-out.ovh.net ([51.210.91.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vWZ-00000004cCA-1E2J;
	Tue, 22 Sep 2026 08:06:49 +0000
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net [79.137.60.223])
	by mo540.mail-out.ovh.net (Postfix) with ESMTPS id 4hpt3B757rz41y9;
	Tue, 22 Sep 2026 08:06:30 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net. [127.0.0.1])
        by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <anup@brainfault.org>; Tue, 22 Sep 2026 08:06:30 +0000 (UTC)
Received: from mta10.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.164.229])
	by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4hpt3B5XYDz1xrq;
	Tue, 22 Sep 2026 08:06:30 +0000 (UTC)
Received: from guillain.net (unknown [10.1.6.5])
	(Authenticated sender: jean-christophe@guillain.net)
	by mta10.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 9DC82781C5E;
	Tue, 22 Sep 2026 08:06:27 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-97G002b68a12e8-2984-420b-a186-13f4c06436ba,
                    1B11FA1B799B51260FD44711AD952BEFB0E4E6B4) smtp.auth=jean-christophe@guillain.net
X-OVh-ClientIp: 78.242.244.78
Message-ID: <792d9ce32849122eed7ecbed22e494f8b624dbc8.camel@guillain.net>
Subject: Re: [PATCH v2 0/7] KVM: Serialize vCPU creation and revert vcpu_ids
 tracking
From: Jean-Christophe Guillain <jean-christophe@guillain.net>
To: Sean Christopherson <seanjc@google.com>, Madhavan Srinivasan	
 <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley	
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, Kiryl
 Shutsemau	 <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Atish Patra
 <atish.patra@linux.dev>,  Alexandre Ghiti	 <alex@ghiti.fr>, Dave Hansen
 <dave.hansen@linux.intel.com>, 	linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, 	kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?UTF-8?Q?Pawe=C5=82?= S	 <spawel523@gmail.com>
Date: Tue, 22 Sep 2026 10:06:21 +0200
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
References: <20260921174445.911676-1-seanjc@google.com>
Autocrypt: addr=jean-christophe@guillain.net; prefer-encrypt=mutual;
 keydata=mDMEaEmXaBYJKwYBBAHaRw8BAQdA1qyia8WH1pu6T8sC99WNMyKXooD/SVqJXsJOcnIux
 w20N0plYW4tQ2hyaXN0b3BoZSBHdWlsbGFpbiA8amVhbi1jaHJpc3RvcGhlQGd1aWxsYWluLm5ldD
 6IlgQTFgoAPhYhBDk2+TsBtH9ETCTubi9QTbKhgBdPBQJoSZdoAhsBBQkSzAMABQsJCAcCBhUKCQg
 LAgQWAgMBAh4BAheAAAoJEC9QTbKhgBdPrq0A/icNhFTYLybFWWq1B42UvJLGs18MNRiT5aLdFv3R
 DfHVAQCvzsLrC/qz4rOyIpDzeb0biOu3fiDTcyvV3kPiu3xTDA==
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
x-ovh-tracer-id: 3964856524915166012
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFDZ4aTcT5SDXmkd602DiweEYgHF4FHP6+h+Q5uvPOfv2ER677KLq0yDhnl+3VfAbnsOmXLuyCPgoyZr+w9DwEYKfDYBsM1GvNB9gelyvBoQQQ1jqTc2VOlb2ES0FKHAEw7Bf5L3b/fe3mquzvbn08slBRFk1e188EYwypcj9s9rZhNO1DYk1mNyKLKeRt/DoUs/s5cymBh82F89HDmI2s1tiBxl8Wr1ZXwxX2zpzSb0PWcSHMqCBDjPAX0FkgCGCL/d6Yl2HIHdXWeJZ1JhfYF+PvruQ1WnjYiU5EVPYFW5Zo8XyORZee15An39kaGtjsRNOOgUE821tWe0jwxcnL/tjXKv+5/16hfPHifvImMPOzEUyeotu4hT4k3MO1mBzM9bjPK0Ge53kXOvdvN3eWSkOwh8ZUiMnTCGvDRHsRriBTLNCO3iKxDfvbsDWv/YF3wOKcvuOaIbT6SyxgcR6Zc8bxUiTYj0J9TfGRfEygMeq2gXCwxFm4Y+Aziu2j67KCrej/IWQcCkXBxtUr8uMovq8EE3D1B62LwAyCKG6fisWjh7fTwVWm14s1BJb0nAGvHicc5WLjJ2cdeknhIvYm7noYy8dltGhFf1/cPZrsEYR1vNt6277gHUY5GuF77GUlPZsEjHlCZnrs5fQ2/CpblZ92YETQlFNm62zJweHxLHQ
DKIM-Signature: a=rsa-sha256; bh=5sO9xaC3qdPyU5zJefRGniTGdXKpOQRu0LktrMQP//k=;
 c=relaxed/relaxed; d=guillain.net; h=From; s=ovhmo31693-selector1;
 t=1790064393; v=1;
 b=QI9ARexol+3F2NhB7XnQCuhvcc5KGGRTJIxVXLliegLGRWPuIPgrRFpRgA9uknVR1Sa4SESl
 T3akrQF/XJwaq5ayxpHCczXK7rf8R+Fd8bNhEQtvvz8sZG2GzLKnoMYc8/tco6QvHsYmJEvMafX
 TtAMbJ/mY7WfJEV981DGq880kXmXrZ/aOpclwoGPTzFqdFq8PEtlxEF7vC12hkkttTJ4mdNv8j9
 1k/pZtD2YR+61OL9hGVtPm8aNlB9Dew1189gXVMM5E9fLxZeFwmZ9tObsD7JYAlWl/ETK3Snl8f
 bfD4os+o5BNLcSdyv+EzHZiBwWmh286ZdNL1qWQljiwiA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_010648_211691_73F496DA 
X-CRM114-Status: UNSURE (   5.38  )
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

Hi Sean,

Just like for the first version, I tested the full V2 series with the
configuration that originally triggered the build failure
(CONFIG_DEBUG_KERNEL=n, CONFIG_KASAN=n).

The kernel builds successfully on adm64, and I booted the resulting
kernel and started two QEMU/KVM VMs without any issues.

Tested-by: Jean-Christophe Guillain <jean-christophe@guillain.net>

Thanks again !

Cheers,
Jean-Christophe Guillain

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
