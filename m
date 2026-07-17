Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7065AC4451B
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 14:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiN89LAXnmRKxiEDHuf/Nh9s0cEpRFti4MtraIi4320=; b=TyKSCn7nEhdmvH
	JOmECPjiPUspTaZfX36tyzv1QydDcV6o5iRmaAbqNqLNjQgMyuStJZPdEQCKjb1wZIB2lnsQZrMuU
	joPH6gUgLAaUEPyGl6miN1D/z3WQ7KvCChZEkWhsx1feo4KzDTpNoISKku0ahhQK0zVCumDaqpt/c
	HBZ5AWdpXc5JcLBtpsW8aISOjS+P18ZYWwHa7TAIDJCCiqgdIR6Fblej2nvXPPKn4Hn2MnU8/tNKG
	B1re/8SH8hmuthVogOopOr36VgBkWNu/LK3V7OPCULBfPkyuCnVGT47VaORZY+4+ENtFGk1aM75dN
	07S+FzpahJePdX4oQBtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjmg-00000002VWH-3jf6;
	Fri, 17 Jul 2026 14:43:26 +0000
Received: from lamorak.hansenpartnership.com ([2604:f440:8:8::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjme-00000002VVK-1Lyi
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 14:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1784298912;
	bh=hxGmcHmTQSG/tdRRf+oOX+HiB6sZ5o3RY6F7qAn0Qg8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=podJ7VXEOrozW0/nEkVk5DUdZHQ+jKSQ6mLUbZdvS3I1Wu4OjMzk94KILfZv/XDzH
	 Ec/FKjwkDHi4qBngcOq9TDTwLIi7MsReMG/FnZhBNLpB6oXFaxJIMafGhoAw1chHHg
	 m2Heto7gdDUeUaH+Dkyw2JU4hBcyj2zcgXY27FjQ=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8c71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 6AF891C0278;
	Fri, 17 Jul 2026 10:35:11 -0400 (EDT)
Message-ID: <570f82e8b8bc968a31a4ba859145f6c324e41247.camel@HansenPartnership.com>
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, Paolo Bonzini
	 <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Tom Lendacky	
 <thomas.lendacky@amd.com>, ashish.kalra@amd.com, michael.roth@amd.com, 
	nsaenz@amazon.com, anelkz@amazon.de, Melody Wang <huibo.wang@amd.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 x86@kernel.org, 	coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
Date: Fri, 17 Jul 2026 10:35:10 -0400
In-Reply-To: <aigE2EvJyZlYDz0V@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
	 <20260608144252.351443-36-joro@8bytes.org>
	 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
	 <aib8n5lO6HKbLC4Y@8bytes.org>
	 <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
	 <aigE2EvJyZlYDz0V@8bytes.org>
Autocrypt: addr=James.Bottomley@HansenPartnership.com;
 keydata=mQENBE58FlABCADPM714lRLxGmba4JFjkocqpj1/6/Cx+IXezcS22azZetzCXDpm2MfNE
 lecY3qkFjfnoffQiw5rrOO0/oRSATOh8+2fmJ6el7naRbDuh+i8lVESfdlkoqX57H5R8h/UTIp6gn
 1mpNlxjQv6QSZbl551zQ1nmkSVRbA5TbEp4br5GZeJ58esmYDCBwxuFTsSsdzbOBNthLcudWpJZHU
 RfMc0ew24By1nldL9F37AktNcCipKpC2U0NtGlJjYPNSVXrCd1izxKmO7te7BLP+7B4DNj1VRnaf8
 X9+VIApCi/l4Kdx+ZR3aLTqSuNsIMmXUJ3T8JRl+ag7kby/KBp+0OpotABEBAAG0N0phbWVzIEJvd
 HRvbWxleSA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT6JAVgEEwEIAEICGw
 MGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAhkBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAml2ZBI
 FCS3GUMIACgkQgUrkfCFIVNZKjQf/deRzlXZClKxTC/Ee2yEPqqS7mm/INUA49KdQQ5oIhSxkUBy0
 9J4qjMIo5F8ZFkFTqikBqeL35LKu7O7rn8WETfX8Bxvos3HUsl3jHo34DES4MUFIpoQPgtiLRGwLb
 K0cVCAArR2u2qj4ABmTRrs1I1kvdjEw6gatOuXtEe/j5O2fvfzTq9GBr0Q3n2IAsFXi4hLlx6VPE8
 tyWUZ8BWJKtih3JAeUiXFvASL3McV0rV9RnU0VbjEQEhSE7PMYhWpnDC9AyBb0lXJllQRvC3NSkUB
 8KVQgNNxRPss0WE/nBoZ4dFA42jTyzTz8lNylxZoAWV7WJb3QxVg4oCodRVrxxrQhSmFtZXMgQm90
 dG9tbGV5IDxqZWpiQGtlcm5lbC5vcmc+iQFVBBMBCAA/AhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeA
 QIXgBYhBNVgbnPItGJxvq2a34FK5HwhSFTWBQJgS5mYBQkbNYS9AAoJEIFK5HwhSFTWBpwIAL5Bk3
 5FB34U6iHmDzzgdCbxLTs43T/YQyJpcGIvopBvnI/fDY8oSG6Df64/O6B+1R+A8TDp6ZG5ysUWnCC
 6GuIaEHemBYkitMPglR6+sGCMQY7O0mlsPvdssvKK1KI9Bno4VU6ogaF2qVzefSqg1Djmf/DcsxWP
 rI/jdJ8FB5AYR2rjIdDFc+zRdAJuavo1/anyY2wgpFh/3R8IOYAEfWV9nGgYkf9+tA4EIn1sxE0I3
 L5oW2N3mbyRrkzuBwO8ztMCwqEPk7moWzhokcZqMXiAIahaZdkashJC+s2X2RZSGCy+g+pvY5NN4B
 BVG5XwLgVBqbHMTcxE0fbmPqz+q6O0LEphbWVzIEJvdHRvbWxleSA8amVqYkBoYW5zZW5wYXJ0bmV
 yc2hpcC5jb20+iQFXBBMBCABBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAmODZ5ACGwMFCRs1hL0F
 CwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQgUrkfCFIVNZu0Af/TzvL2/NdgAcw9uN3x60H8
 jc4QUq14VpxcFEFEMpcj1morkX/G93V+56HBBaXZj+yK8PhxIA/SIz+sU7C/0YvKuvzakP8ZX/7WJ
 e32SOUtjfr/VTaqjIBzNj6OxLvZpmNbBw7s6DwhhNpHOWqJ/1ml+PtDRDV71IB58yVqQjp1xlNKVl
 ZppcJ5908EJzsFnRIVjiQiDSKoppqB2BCibBbrWcln7CiWMyOC/cco6SIn6twH+f7+aivJ3xGcOE2
 a9gBKF5rNi9TBoX9oyPmshv/TDmnohsVrH7AYXlGYfZTk15SWEiROh1QX8/uD9wl/gcIv5EDUpT/F
 L2jzOsA5663bw==
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074324_426047_735F960B 
X-CRM114-Status: GOOD (  18.13  )
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

T24gVHVlLCAyMDI2LTA2LTA5IGF0IDE0OjM3ICswMjAwLCBKw7ZyZyBSw7ZkZWwgd3JvdGU6Cj4g
SSByZWFkIGEgYml0IG1vcmUgYWJvdXQgVlNNIGFuZCBpdCBzZWVtcyB0aGVpciBwcmlvcml0aXph
dGlvbiBvZiBWVExzCj4gaXMgYSBiaXQgbW9yZSBjb21wbGljYXRlZC4gVlRMMCBoYXMgdGhlIGxl
YXN0IHByaXZpbGVnZXMgYnV0IGJvb3RzCj4gZmlyc3QsIHRoZW4gc2V0cyB1cCBWVEwxLiBCdXQg
VlRMMSBpcyBvbmx5IGhpZ2hlci1wcml2aWxlZ2VkIG9uY2UgaXQKPiBpcyBsb2NrZWQgYnkgVlRM
MC4gQW5vdGhlciB3YXkgdG8gbG9vayBhdCBpdCBpcyB0aGF0IFZUTDAgZGUtCj4gcHJpb3JpdGl6
ZXMgaXRzZWxmLgoKQWN0dWFsbHksIEkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSB0byBmb2xsb3cgdGhl
IFZTTSBtb2RlbC4gIEFsbCB3ZSBhdApNaWNyb3NvZnQgY2FyZSBhYm91dCBpcyB0aGF0IHdlIGNh
biBlbXVsYXRlIFZTTSB3aXRoIHRoZSBwbGFuZXMKcHJpbWl0aXZlcyBwcm92aWRlZC4KClRoZXJl
J3MgYSBkZWZpbml0ZSByZWFzb24gbm90IHRvIGRvIHN0cmljdCBWVEwgcHJpdmlsZWdlIGluIHRo
YXQgb25lCmNhbiBzZWUgdHdvIG11dHVhbGx5IGRpc3RydXN0aW5nIHBsYW5lcyBzaGFyaW5nIGEg
Y29tbW9uIGNvbW11bmljYXRpb24KYXJlYS4gIFRoaXMgaXMgZGVmaW5pdGVseSBwb3NzaWJsZSB3
aXRoIFREWCBhbmQgc28gcGxhbmVzIHNob3VsZG4ndApkaXNhbGxvdyBpdC4KCj4gVGhlIHBhdGNo
ZXMgaGVyZSBhcmUgYnVpbHQgYXJvdW5kIHRoZSBhc3N1bXB0aW9uIHRoYXQgcGxhbmUwIGlzIHRo
ZQo+IGhpZ2hlc3QgcHJpdmlsZWdlZCBvbmUgYW5kIGlzIGFsd2F5cyBydW5uYWJsZS4gUnVubmlu
ZyBhbnkgbG93ZXItCj4gcHJpdmlsZWdlIHBsYW5lIG11c3QgYmUgdHJpZ2dlcmVkIGJ5IHRoZSBn
dWVzdC4gVGhpcyBpcyBjbGVhcmx5IG5vdAo+IHN1ZmZpY2llbnQgZm9yIFZTTSwgdGhlIHF1ZXN0
aW9uIGlzIGhvdyB0byBzb2x2ZSB0aGF0LgoKU28gdGhpcyBhbGwgZGVwZW5kcyBob3cgdGhlIHBs
YW5lcyBhcmUgc3RhcnRlZC4gIElmIHlvdSdyZSBzdGFydGluZwp0aGVtIGZyb20gYW4gSUdWTSBm
aWxlIHRoYXQgbG9hZHMgdGhlIG1vc3QgcHJpdmlsZWdlZCBjb2RlIGFuZCB0aGVuCnJ1bnMgdGhl
IGd1ZXN0IGluIGEgZGlmZmVyZW50IHBsYW5lLCBhYnNvbHV0ZWx5LCBpdCBjYW4gd29yayBhcyB5
b3UKZGVzY3JpYmUuICBIb3dldmVyLCB0aGUgY29tbW9uIHVzZSBjYXNlIGZvciBzZXJ2aWNlYWJs
ZSBzZWN1cml0eQplbmNsYXZlcyBpcyB5b3Ugc3RhcnQgdGhlIGtlcm5lbCBmaXJzdCAobmVjZXNz
YXJpbHkgaW4gcGxhbmUgMCkgYW5kCnRoZW4gYnJpbmcgdXAgdGhlIGVuY2xhdmVzIGxhdGVyIHdo
aWNoIG1lYW5zIHRoZSBwbGFuZXMgPiAwIGFyZQp0ZWNobmljYWxseSBoaWdoZXIgcHJpdmlsZWdl
IHNpbmNlIHRoZXkncmUgcnVubmluZyBoaWRkZW4gc2VjdXJpdHkKY29kZS4gIEhPV0VWRVIsIHRo
ZXJlJ3Mgbm8gcmVhc29uIGF0IGFsbCB0byB0cnVzdCBhIHNlY3VyaXR5IGVuY2xhdmUKdGhhdCdz
IGRvaW5nIHNvbWV0aGluZyBsaWtlIGd1YXJkaW5nIHByaXZhdGUga2V5cyB0byBiZSBhYmxlIHRv
IHBva2UKYW55d2hlcmUgaXQgd2FudHMgaW4gdGhlIGd1ZXN0IC4uLiB0aGF0J3MgYSBzZWN1cml0
eSBicmVhY2ggd2FpdGluZyB0bwpoYXBwZW4sIHNvIGl0IHdvdWxkIHJlYWxseSBiZSBiZXR0ZXIg
aWYgdGhlIG1vZGVsIHdlcmUgbm90CmhpZXJhcmNoaWNhbCwgYnV0IG1vcmUgYWtpbiB0byB0aGUg
YWJpbGl0eSB0byBzZWFsIHBsYW5lcyBvZmYgZnJvbSBlYWNoCm90aGVyLCBzbyB0aGUga2VybmVs
IGNhbiBzdGFydCB0aGUgZW5jbGF2ZSwgd2hpY2ggd291bGQgdGhlbiBzZXQgaXRzZWxmCmFuZCB0
aGUgY29tbXVuaWNhdGlvbiBhcmVhIHVwLCBidXQgdGhlbiB0aGUgcGxhbmUgMCBrZXJuZWwgd291
bGQgcmVtb3ZlCmFjY2VzcyB0byBtb3N0IG1lbW9yeSBmcm9tIHRoZSBlbmNsYXZlLgoKSW4gdGhp
cyBzZWFsaW5nIG1vZGVsLCB0aGVyZSdzIG5vIGFic29sdXRlIHByaXZpbGVnZSBsZXZlbHM7IGVh
Y2ggcGxhbmUKd291bGQgZGVjaWRlIHdoYXQgdGhlIG90aGVyIHBsYW5lcyBjYW4gc2VlIG9mIGl0
cyBtZW1vcnkgc3BhY2UgYW5kLCBvbgpzZWN1cml0eSBncm91bmRzLCB3ZSdkIGxpa2VseSBjb25m
aWd1cmUgdGhlIGVuY2xhdmVzIHRvIGhhdmUgdGhlIGxlYXN0CnBvc3NpYmxlIHByaXZpbGVnZS4K
Ck5vdywgV2luZG93cyBhcHBsaWNhdGlvbnMgZXhwZWN0IFZTTSB0byBiZSBzdHJpY3RseSBoaWVy
YXJjaGljYWwgaW4KdGVybXMgb2YgcHJpdmlsZWdlLCBidXQgaWYgd2UgY3JlYXRlIGEgc2VhbGlu
ZyBwcmltaXRpdmUgYXMgZGVzY3JpYmVkCmFib3ZlLCB3ZSBjYW4gZ2V0IGl0IHRvIGJ1aWxkIHRo
ZSBzdHJpY3QgVlNNIHByaXZpbGVnZSBoaWVyYXJjaHkgaW4gdGhlCmh5cGVyLXYgZHJpdmVyLgoK
UmVnYXJkcywKCkphbWVzCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
