Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0A3C87FC9
	for <kvm-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvfs8TWfGAYYZ8BgCOe0zT8qH7NBWwxVi8Qbhvng5x8=; b=F0WCEb6J9Lrcb9
	Q95ZnNqDV21o8eTwKEnI6COstauHIOcsgFNoXraVbXWFVdoqrHwZiIKFtD47EO6Hrl9vcBS/Pah4Z
	s7+Ui7yyLfAWCSm8tBXrsMJxQSYIYXWpxD00aNb2zfXNd36OCS6Q0YcaBriARR8GfidClEMK0gnWB
	HCIPXHaMA8ZJqx08WLWyvBZ45i2vtRk6yWYbZUIkOwMGCYaCuEK7ylagUmcxqtJ8WxlOi5vUHKq+7
	bc6ZPRpC+vZ/6PqfExbVgCnJYYptAXMflEOgwRPSJ8RtVQDX1m5z0zvic1DXunLeVV6p/2uXP8VIo
	xnlY3Ttyw3oroDsUP69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiz4-0000000Gfj0-1Jo8;
	Tue, 29 Jul 2025 11:59:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiz2-0000000Gfh7-0fN0
	for kvm-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 11:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753790343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Mt286fE3fr9exZwFOAwUHjGEk4EhTOfKtbO13ISjIXE=;
	b=VrVTzUZnEvvKTCKvbh+ggzRhkbFOOUQxZBZ6LYOvVhyvs0gfP/nH1nRwxPcx3iF9ur5f9L
	MrZ6a0oRuSQZttuVlsi8WfDbeTkIGwKK7P2uFTM0QxlE+m3/KHTOcwBNiUSulrXy0QzSBB
	L/TepVXwK1I/0b4Z1a1ghDoEtFn2vWA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-WzfHD6ijNVWAFE2tqs_p6A-1; Tue, 29 Jul 2025 07:58:59 -0400
X-MC-Unique: WzfHD6ijNVWAFE2tqs_p6A-1
X-Mimecast-MFC-AGG-ID: WzfHD6ijNVWAFE2tqs_p6A_1753790338
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4588cfda8b6so6955795e9.0
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Jul 2025 04:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790338; x=1754395138;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mt286fE3fr9exZwFOAwUHjGEk4EhTOfKtbO13ISjIXE=;
        b=q0oIbm+6Dt+WADn4XKgeI14uX+aNWhrgSzri11aOLnvq62CYI6CrHBYDutGjKwurbf
         oRbx+vcuBhFHJPjJw36uMGA4NDBl+vd35wPCaOUbmK8ECzbrvqrCmnWChkHRCPNfGsBN
         mvIXwrF7NRKC9CSLC48QrVjTUQUkp1MId05B8cipd0udV8f8RpialR2yDK99paCAtTwf
         FluVBmQKh807hUTU0XMiDS7TXClSIB/fQIiJ11Wen7wXhQlADg/+OsPh1VvhAARszue2
         UijBELVZgU66kBAyQXZ+GTc7R3Ko9N50WtdbJ32ipbAteMxkJ68vNSqHFVDY2CLzk3E7
         z2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr4rvIuyA5Puw6x845iUjoFvCaNm2IfFEcrFRxne2kUdEivbrRXGJWzv63Uxjomns5TFpfygQh224=@lists.infradead.org
X-Gm-Message-State: AOJu0YxldSJclEPxa69lNABK0/2EHW2phKpiAQ/B44M2u62+ej/zPDma
	LSxFXjdY8V1LYh1bJ/OkO2AHKw2xmTGq0UNmYOui9eDlD1igIa2nBhzBVxSSgjOcvU2tpnFOoEh
	NrQI76Y6pJ7IXL0Qec88vgpa4C0GNn+3BJI6vy7CGe8Qg92OUPk6TyLkLtI5c+kj1t+M=
X-Gm-Gg: ASbGncvpd65D/XMZnAmjS8AKpEw8KsDt45I1rX6SALqgXSHa4+1vnm6G7KIDWai6Pwd
	l7RSYIdAWrw+etAT/lWf67z92ACRksRExght3p6gZtTEj/HNGqXUBGcpOcV5SRwQ8VMTHa/b80z
	qXoQsy3n+cV+EgFwtJGSUTnYgM4kmeK59zBJ1+shpsxHXSdlruq/KjjS4TbAVOFXmjwKxKl3Fzb
	LiZ6o3l9jsLVhjGclEwP0eZPjaa0jWy1TxCRzIetpyM5Atgfyw7EkXGqiEtn3wCUd08oGEKVGDj
	yBRHCtckHSoj0qirwOP2E8kuYb8/lpJBgGLH8ydF+cLY
X-Received: by 2002:a05:600c:1992:b0:455:fc16:9ed8 with SMTP id 5b1f17b1804b1-45876651bfamr150542675e9.30.1753790338308;
        Tue, 29 Jul 2025 04:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi4+v6oNFjQhbcYthmDOzNaUqcEt6rvGHmIzYzlsi7OQ7zXry3yI7rWQcJKU17VzbPC5UuOg==
X-Received: by 2002:a05:600c:1992:b0:455:fc16:9ed8 with SMTP id 5b1f17b1804b1-45876651bfamr150542175e9.30.1753790337511;
        Tue, 29 Jul 2025 04:58:57 -0700 (PDT)
Received: from [192.168.10.81] ([151.95.154.122])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b7908161e3sm2262031f8f.37.2025.07.29.04.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 04:58:56 -0700 (PDT)
Message-ID: <a486e649-d2c0-471c-87f2-c7a01dff9ae4@redhat.com>
Date: Tue, 29 Jul 2025 13:58:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Atish Patra <atish.patra@linux.dev>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
 <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
 <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com>
 <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com>
 <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
 <DBOIBORLK6YM.7SND5YPEJR60@ventanamicro.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <DBOIBORLK6YM.7SND5YPEJR60@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qUVEqIR1CVi38ga0BOxAIum5FVGQVqc60aglESjneB8_1753790338
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_045904_261864_61D6F4A4 
X-CRM114-Status: UNSURE (   8.88  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gNy8yOS8yNSAxMzozNywgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+IFNvcnJ5LCBJIGRpZG4n
dCB0cnkgdG9vIGhhcmQgdG8gY29udmluY2Ugb3RoZXJzIGFmdGVyIG5vdGljaW5nIGl0LCBhbmQK
PiBwbGFubmVkIHRvIGZpeCB0aGUgbW9zdCBzaWduaWZpY2FudCBicmVha2FnZSBpbiBsYXRlciBy
Y3MuCgpZb3Ugc2hvdWxkbid0IGhhdmUgdG8gY29udmluY2UgYW55b25lLCAKRG9jdW1lbnRhdGlv
bi92aXJ0L2t2bS9yZXZpZXctY2hlY2tsaXN0LnJzdCBpcyBwcmV0dHkgY2xlYXI6IG5ldyBzdGF0
ZSAKbXVzdCBpbmNsdWRlIHN1cHBvcnQgZm9yIHNhdmUvcmVzdG9yZSwgbmV3IGZlYXR1cmVzIG11
c3QgZGVmYXVsdCB0byBvZmYsIAphbmQgdGhlIGZlYXR1cmUgc2hvdWxkIGJlIHRlc3RhYmxlLgoK
VGhlIGZpbGUgd2FzIGp1c3QgdXBkYXRlZCAoYW5kIG5vdyBtYWtlcyBmdXJ0aGVyIHJlbWFya3Mg
YWJvdXQgdGVzdGluZyksIApidXQgdGhlIHNhbWUgdGhpbmdzIHdlcmUgYmFzaWNhbGx5IGluIHRo
ZSBvbGRlciB2ZXJzaW9uLgoKU28geW91IG5lZWQ6CgotIGEgS1ZNX0VOQUJMRV9DQVAgdG8gZW5h
YmxlL2Rpc2FibGUgRldGVAoKLSBhbiBpb2N0bCB0byBnZXQgdGhlIGxpc3Qgb2YgRldGVCBmZWF0
dXJlcyAoa2luZCBvZiBsaWtlIApLVk1fR0VUX01TUl9JTkRFWF9MSVNUIG9uIHg4Nj8gIEl0IHNl
ZW1zIHVubGlrZWx5IHRoYXQgeW91IGdldCBtb3JlIHRoYW4gCjUwIG9yIDYwKQoKLSBhbiBpb2N0
bCB0byBlbmFibGUvZGlzYWJsZSBGV0ZUIGluZGl2aWR1YWwgZmVhdHVyZXMKCi0gdGhlIEdFVC9T
RVRfT05FX1JFRyB0byBtaWdyYXRlIHRoZSBzdGF0ZSBldGMuCgotIHNlbGZ0ZXN0cwoKCj4gKElm
IEZXRlQgd2Fzbid0IGVuYWJsZWQgYnkgZGVmYXVsdCwgc2FuZSB1c2Vyc3BhY2UganVzdCB3b3Vs
ZG4ndCBleHBvc2UKPiAgIEZXRlQgdG8gdGhlIGd1ZXN0IHVudGlsIGEgcHJvcGVyIEtWTSBjb25m
aWd1cmF0aW9uIHdhcyBhZGRlZCkuCgpUaGF0IG1lYW5zIHRoYXQgdGhlIGJhcmUgbWluaW11bSBm
b3IgaW5jbHVzaW9uIGluIEtWTSBpcyB0aGUgZmlyc3QgdGhyZWUgCmJ1bGxldHMgYWJvdmUuICBC
dXQgYXQgdGhpcyBwb2ludCwgbGVhdmluZyBvdXQgdGhlIGZvdXJ0aCBpcyBqdXN0IApzbG9wcHk7
IGFuZCB0ZXN0cyBhcmUgbm90IHJlYWxseSBvcHRpb25hbCB1bmxlc3MgeW91IGhhdmUgYWxyZWFk
eSBwb3N0ZWQgCmEgdXNlcnNwYWNlIGltcGxlbWVudGF0aW9uLgoKVGhhbmtzLAoKUGFvbG8KCgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
