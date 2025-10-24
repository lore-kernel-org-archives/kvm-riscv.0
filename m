Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55427CCF9E0
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uicTSApyaiCsfIFh7i4hTCjNbshEifjCTBpttkwuJ7g=; b=gj9zqWLJcVyh+S
	rF+MiDUaiEWJvyRmf9efcN/U74vRfxCYQ1R5y9eAgw8/BQjC8wEwXeqz4N8bR/oJyxP/lZz+lOAyv
	lqMyrpeKvD7SrkA8IdUKGtiMuRK3cXaBJqv0qmv0A1SPUvtZpTPlX5A2aoGpr/udAT4zaaNvbsHLI
	0vDxNOKdJN16L8gD6BRe7lHv5x9PLNkba+fw9GLVhUMBgftwmWVeRSOAP30rWav/i6l4qBLHCy8W3
	AX8TxqQFrTc5YRTU0VJhcLWainRcjksdNE3eHV50Hg+6GLvQSI7hkbMHYDj4Amzrt3vx4yWzT3/SM
	F6l2CVY3J6N9qVBvnGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK0N-00000009qUz-3dG1;
	Fri, 24 Oct 2025 15:47:03 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK0J-00000009qT3-3Jmb
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 15:47:02 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-591ea9ccfc2so2871356e87.1
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Oct 2025 08:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761320818; x=1761925618; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qn/+5LSgb4Ivu5qW8rNSwz2BTYP5iSWYVocmoADghq0=;
        b=ZhVFIkG1TwxadO58mc3s8neQEiCMa8K5xZP8AA8nCbwdtJt3f/aKU6HiyVi3uyMqw+
         8zD4ePTXvKwNRfc6omlf8qR/mLDJLLWMsjDUirGOZgC5FdeU4DwqJErf6Rb1w+9749+8
         vDxpAdE6Xd4MKZ0eTKuEQJBMgtYLKJJqRVq7tN7SxCJ2A2dycWe1aKs/Csb4t7l3ZQLV
         nfJcADEn6lesQf12VTXUXnwLsNLyizUzBOhRXSOIZrP5GXxe4TJDmD+xaPNORkHilLWi
         FMLj98+kdIXoQgNKmwTPwdCQ9hZCNSE24WmNp1WcslrG79dCnI9r6SCDQbrdd9FYiyn2
         RKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761320818; x=1761925618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qn/+5LSgb4Ivu5qW8rNSwz2BTYP5iSWYVocmoADghq0=;
        b=HofwqxEumVRU52wNYp2QHUTq7++aXbuz2uB9lMgUw4mRsDas2KSCzfs9NbwKW80w0V
         Djx4US7tOaWPyAQUO1iv31zdZma6tqo6qw2uEMtH59QeV00AomK/rS+IBXHPwHRjzK5t
         5syz2ED1P77uMOkk8ISGAc1w1UX5VieproUAAq41aWrVPWyvH0eHIupH17RDsmq/dpoK
         Z879oD5VWMvA2MBdmN+QERFGEFnzynf/DkV9BzUseyXsn2HKf3YaP8+c7HzZA0ixmJ0s
         jL3QwqE7/ZUmx3HKLcqATCI+yVoga41tg5blYilmGcQB2q704IwiQs+zedIe4FzIVly8
         tRCg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0XedQ1m/P9b/V6YCxXTq0qR1U4ZagkybCqnxODHl+zxt2WpERz18N3iQYHHnujSQI2bxfT3htFE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWt7WrO1SD/HuNLVPwEIapXGpUzrbwlWYvFSCF1EDOA/2wFT1N
	NU8BbTL5/6FGiDyL1BlvVrmS3MyDV35uNeNmZMdJ+aXv1MSo5kkd/uGIn5IykASU9XOpS/AHmph
	gcSOI1W53xrEPb7uHrLdFfzD8pJLaHfXOAwqte9VpRuQ4B6IPgRRc
X-Gm-Gg: ASbGncusrG7yHM2suhHOAIXfRE5Kddb7iVrElS86NJ+I4r1YqM5Y2hrrr/v8TZo88n4
	b4wp+Ytfq/oDPxLm6+2eesJFfyQY8wP09/VHItD/xc0yxs56xz9eS4YWBvMu2xVhYDC/xdQNqvH
	+yqn0+BHikYmhhH4fHgj+/j8FWZxcrsTN61bkKEpruoNSwoLfRAmkpG1N1jzdOohaET9wYEYntN
	fdR+F+omHu2G8ZPaCwElXeuHZyJt0J6UTvRGDCctqgjBvEsTbZ+6axGoki8AQ==
X-Google-Smtp-Source: AGHT+IHdluFO85waETK/KLkbS3VYmEGHof52U3/ULO+x99Eru8BPoeAX0r1u9msXeZkbSU5Z2jh0fCXXs/3AzKJBMNI=
X-Received: by 2002:a05:6512:3b8e:b0:592:ed6f:9a59 with SMTP id
 2adb3069b0e04-592fc0fa4camr1180695e87.2.1761320817702; Fri, 24 Oct 2025
 08:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0h=PuKTG=aWou_8y8qb7kSHS46TLXoXrjrTXN1xv-uQg@mail.gmail.com>
In-Reply-To: <CAAhSdy0h=PuKTG=aWou_8y8qb7kSHS46TLXoXrjrTXN1xv-uQg@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 24 Oct 2025 21:16:45 +0530
X-Gm-Features: AS18NWAZshTymUeon3-SNkimUIgzYNwnvkiP5JITg3o0ZerB1osHRyFXcW_yBwI
Message-ID: <CAK9=C2VXQRGFChGB2xzkRCzf_GbH2VexjAjO2d83e_tSwhddcw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.18 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_084659_852941_C9FB269E 
X-CRM114-Status: GOOD (  15.39  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFvbG8sCgpPbiBGcmksIE9jdCAyNCwgMjAyNSBhdCA0OjM54oCvUE0gQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4KPiBIaSBQYW9sbywKPgo+IFdlIGhhdmUgdGhy
ZWUgZml4ZXMgZm9yIHRoZSA2LjE4IGtlcm5lbC4gVHdvIG9mIHRoZXNlCj4gYXJlIHJlbGF0ZWQg
dG8gY2hlY2tpbmcgcGVuZGluZyBpbnRlcnJ1cHRzIHdoZXJlYXMKPiB0aGUgdGhpcmQgb25lIHJl
bW92ZXMgYXV0b21hdGljIEkvTyBtYXBwaW5nIGZyb20KPiBrdm1fYXJjaF9wcmVwYXJlX21lbW9y
eV9yZWdpb24oKS4KPgo+IFBsZWFzZSBwdWxsLgoKUGxlYXNlIGRpc3JlZ2FyZCB0aGlzIFBSLiBJ
IHdpbGwgc2VuZCB2MiBQUiB3aXRoIGEgYnVpbGQgd2FybmluZyBmaXguCgpBcG9sb2dpZXMgZm9y
IHRoZSBub2lzZS4KClJlZ2FyZHMsCkFudXAKCj4KPiBSZWdhcmRzLAo+IEFudXAKPgo+IFRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgM2E4NjYwODc4ODM5ZmFhZGI0ZjFhNmRkNzJj
MzE3OWMxZGY1Njc4NzoKPgo+ICAgTGludXggNi4xOC1yYzEgKDIwMjUtMTAtMTIgMTM6NDI6MzYg
LTA3MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAg
aHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlzY3YtZml4
ZXMtNi4xOC0xCj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYmUwMWQ0ZDVjMzAx
MTRlOWRmMzdmY2E5ZWZiYjJjNWNiMGFkMzZmNjoKPgo+ICAgUklTQy1WOiBLVk06IFJlbW92ZSBh
dXRvbWF0aWMgSS9PIG1hcHBpbmcgZm9yIFZNX1BGTk1BUCAoMjAyNS0xMC0yNAo+IDExOjAwOjQ4
ICswNTMwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+IEtWTS9yaXNjdiBmaXhlcyBmb3IgNi4xOCwgdGFrZSAjMQo+
Cj4gLSBGaXggY2hlY2sgZm9yIGxvY2FsIGludGVycnVwdHMgb24gcmlzY3YzMgo+IC0gUmVhZCBI
R0VJUCBDU1Igb24gdGhlIGNvcnJlY3QgY3B1IHdoZW4gY2hlY2tpbmcgZm9yIElNU0lDIGludGVy
cnVwdHMKPiAtIFJlbW92ZSBhdXRvbWF0aWMgSS9PIG1hcHBpbmcgZnJvbSBrdm1fYXJjaF9wcmVw
YXJlX21lbW9yeV9yZWdpb24oKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEZhbmd5dSBZdSAoMik6Cj4gICAgICAg
UklTQy1WOiBLVk06IFJlYWQgSEdFSVAgQ1NSIG9uIHRoZSBjb3JyZWN0IGNwdQo+ICAgICAgIFJJ
U0MtVjogS1ZNOiBSZW1vdmUgYXV0b21hdGljIEkvTyBtYXBwaW5nIGZvciBWTV9QRk5NQVAKPgo+
IFNhbXVlbCBIb2xsYW5kICgxKToKPiAgICAgICBSSVNDLVY6IEtWTTogRml4IGNoZWNrIGZvciBs
b2NhbCBpbnRlcnJ1cHRzIG9uIHJpc2N2MzIKPgo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMu
YyB8IDE2ICsrKysrKysrKysrKysrLS0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgICAgICAgfCAy
MCArLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICB8ICAy
ICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0p
Cj4KPiAtLQo+IGt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKPiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
