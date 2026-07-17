Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13382C44515
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uidul6giG29bc8B5HERIjowtIAcbkha1op3PI+L7Tg=; b=JM9kh+iNrI6nhA
	9y7REF4fV0Mt3lpoKv2Xm8HJPbkAE/Mp2JoZrWRZ1TcUNe3ZsytWwwEco1x7yneUWBYY3HTq1K1cP
	COYefL0GmETebuU5Za1Wo0CUQk9FFnIxTEmn+kgafjZeQOTk1ysj1jJQTpkVOlmXKmFy6+W1adsdW
	SGHuLA5/WnXEqjddpO/C1xWDsbVwVrGh2lMU5og/TAM/MeN7LQ64PwWEYIS9nQ+cIS6/MI9lO+esr
	RZtL+M16EUolKvkvCdhQs+Y4Xu+psqKik9rBL9xMJwiPKEgpLC6yCPoMautXHUe7UJswopW9n2Y81
	yeeHPHxH+20w9HfLgCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkvE-00000002gHt-33Gp;
	Fri, 17 Jul 2026 15:56:20 +0000
Received: from lamorak.hansenpartnership.com ([198.37.111.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkvD-00000002gHN-0kE4
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 15:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1784303776;
	bh=8E/aCvafBerjGcyt/czXHn8A+QbSJiP1ZLClAh2Nqf8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=pE4JSA7LDo31TtOH6lVhRGLmgo69Rq7uIrlsGvhRqaaCuqGH7NIbVKEBzPNgbzlr0
	 HfhhSUxH3Jy6Mco8uMYCXMhJUMKRW6EZYi47aVY5QkDAHN2pfU1WiTnh9hqOrO5bQR
	 i7p7VxY4n38UceajEGhvjud0cMrlCjcs/V9aUfxM=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8c71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id AA4091C029F;
	Fri, 17 Jul 2026 11:56:15 -0400 (EDT)
Message-ID: <976f1a8316438d5b7c2f446a0369dcda3289cc92.camel@HansenPartnership.com>
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Saenz Julienne, Nicolas" <nsaenz@amazon.es>, 
 =?ISO-8859-1?Q?J=F6rg_R=F6del?=
	 <joro@8bytes.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Tom Lendacky	
 <thomas.lendacky@amd.com>, "ashish.kalra@amd.com" <ashish.kalra@amd.com>, 
 "michael.roth@amd.com"	 <michael.roth@amd.com>, "Orazgaliyeva, Anel"
 <anelkz@amazon.de>, Melody Wang	 <huibo.wang@amd.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "kvmarm@lists.linux.dev"	 <kvmarm@lists.linux.dev>,
 "loongarch@lists.linux.dev"	 <loongarch@lists.linux.dev>,
 "linux-mips@vger.kernel.org"	 <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org"	 <linuxppc-dev@lists.ozlabs.org>,
 "kvm-riscv@lists.infradead.org"	 <kvm-riscv@lists.infradead.org>,
 "x86@kernel.org" <x86@kernel.org>,  "coconut-svsm@lists.linux.dev"	
 <coconut-svsm@lists.linux.dev>, "joerg.roedel@amd.com"
 <joerg.roedel@amd.com>
Date: Fri, 17 Jul 2026 11:56:15 -0400
In-Reply-To: <DK0W6G329B6W.2KGT7FAVSKNYS@amazon.com>
References: <20260608144252.351443-1-joro@8bytes.org>
	 <20260608144252.351443-36-joro@8bytes.org>
	 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
	 <aib8n5lO6HKbLC4Y@8bytes.org>
	 <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
	 <aigE2EvJyZlYDz0V@8bytes.org> <DK0W6G329B6W.2KGT7FAVSKNYS@amazon.com>
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
X-CRM114-CacheID: sfid-20260717_085619_286452_4B6C0A59 
X-CRM114-Status: GOOD (  34.82  )
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

T24gRnJpLCAyMDI2LTA3LTE3IGF0IDEzOjQ4ICswMDAwLCBTYWVueiBKdWxpZW5uZSwgTmljb2xh
cyB3cm90ZToKPiBIaSBKb2VyZywgSSdtIGEgYml0IGxhdGUgdG8gdGhlIGRpc2N1c3Npb24gaG9w
ZSBpdCBoZWxwcyBub25ldGhlbGVzcywKPiAKPiBPbiBUdWUgSnVuIDksIDIwMjYgYXQgMjozNyBQ
TSBDRVNULCBKw7ZyZyBSw7ZkZWwgd3JvdGU6Cj4gPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdp
bmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvCj4gPiBub3QgY2xpY2sg
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZQo+ID4g
c2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCj4gPiAKPiA+ID4gVGhlIGlkZWEg
b2YgdGhlIHVzZXJzcGFjZSBzY2hlZHVsaW5nIHdhcyB0aGF0IHlvdSdyZSBub3QgZm9yY2VkCj4g
PiA+IHRvIHVzZSBpdCAtIHRoZSBrZXJuZWwgY2FuIGFsd2F5cyBjaG9vc2UgdG8gb3ZlcnJpZGUg
aXQgaWYgaXQncwo+ID4gPiB1c2luZyBhbiBhY2NlbGVyYXRlZCBpbXBsZW1lbnRhdGlvbiBvZiBw
bGFuZXMgKGFuZCBvZiBwbGFuZQo+ID4gPiBzd2l0Y2hpbmcpLiBCdXQgaXQgYWxzbyBsZWF2ZXMg
c29tZSBsZWV3YXkgdG8gZGlmZmVyZW50Cj4gPiA+IGFjY2VsZXJhdGVkIGltcGxlbWVudGF0aW9u
cywgZWFjaCBvZiB3aGljaCBjYW4gcGljayB0aGVpciBvd24KPiA+ID4gYWxnb3JpdGhtLgo+ID4g
PiAKPiA+ID4gQ29uY2VwdHVhbGx5IEknZCByYXRoZXIga2VlcCB0aGUgcG9zc2liaWxpdHkgb2Yg
dXNlcnNwYWNlCj4gPiA+IHNjaGVkdWxpbmcuIEJ1dCBtYXliZSBpdCBkb2Vzbid0IGFkZCBtdWNo
Lgo+ID4gCj4gPiBNeSBwcmVmZXJlbmNlIGlzIHRvIGtlZXAgcGxhbmUgc2NoZWR1bGluZyBhdCBv
bmUgcGxhY2UgKGluIHRoZQo+ID4ga2VybmVsKSB0byBrZWVwIGl0IHNpbXBsZS4gQnV0IGlmIHlv
dSBzZWUgYSBuZWVkIGZvciB1c2VyLW1vZGUgdG8KPiA+IGludGVyYWN0IHRoZXJlIGFzIHdlbGwg
KG9ubHkgcmVhbGx5IHdvcmtzIGZvciBWU00pLCB0aGVuIEkgY2FuIGFkZAo+ID4gaXQuCj4gCj4g
VGhlIHJlc3BvbnNpYmlsaXR5IHNwbGl0IHdlIGhhZCBpbiBtaW5kIHdoZW4gd2UgYnVpbHQgYSBW
U00gZW11bGF0aW9uCj4gcHJvdG90eXBlIFsxXSB3YXMgdG8ga2VlcCBhbGwgVlRMIHBvbGljaW5n
IGluIHVzZXItc3BhY2UuIFRoaXMKPiBpbmNsdWRlcyBWVEwgc3dpdGNoaW5nLCBDcm9zcyBWVEwg
SVBJcywgSW50ZXJjZXB0cyAoTWVtb3J5LCBNU1JzLAo+IEluc25zLCBDUFUgcmVncyksIFZUTCBh
d2FyZSBTTVAgYnJpbmctdXAsIGV0Yy4gRXZlbiB3aXRoIEtWTSBQbGFuZXMKPiBpbiBwbGFjZSwg
bXkgdGhpbmtpbmcgd2FzIHRvIGtlZXAgaXQgYXMgc3VjaC4gV2hpbGUgYWxsIHRoaXMgY291bGQg
YmUKPiBpbXBsZW1lbnRlZCBpbiB0aGUga2VybmVsLCBpbiBwcmFjdGljYWwgdGVybXMsIEkgdGhp
bmsgaXQnbGwgYmUKPiBlYXNpZXIgdG8gZ2V0IFZTTSBzdXBwb3J0IHVwc3RyZWFtIHRoZSBtb3Jl
IHdlIG1vdmUgdGhlCj4gaW1wbGVtZW50YXRpb24gaW50byB1c2VyLXNwYWNlLgoKSSBsb29rZWQg
YXQgdGhlIGtlcm5lbCBiaXQuICBUaGUgdnNtL2RldiBicmFuY2ggY29udGFpbnMgNzIgcGF0Y2hl
cwpvdmVyIDYuMTIgd2hpY2ggaXMgcXVpdGUgYSBsb3QgLi4uCgpIb3dldmVyLCBmcm9tIGEgcXVp
Y2sgc2tpbSwgdGhlIG1haW4gdGhpbmcgaXMgdGhhdCB5b3UgdXNlZCBtdWx0aXBsZQpLVk0gc3Ry
dWN0dXJlcyB0byBtYW5hZ2UgdGhlIHBsYW5lcyB3aGljaCBtZWFucyBlYWNoIHBsYW5lIG5hdHVy
YWxseQpnZXRzIGl0cyBvd24gYWRkcmVzcyBzcGFjZS4gIEluIHRoZSBjdXJyZW50IHBsYW5lcyBt
b2RlbCBzbyBmYXIgdGhlcmUncwpvbmx5IG9uZSBhZGRyZXNzIHNwYWNlIChvciB0d28gaWYgeW91
IGhhdmUgU01NKS4gIFNOUCBkb2Vzbid0IG5lZWQKYW55dGhpbmcgYWJvdmUgdGhpcyBiZWNhdXNl
IHRoZSBWTVBMIHByb3RlY3Rpb24gaXMgbmF0dXJhbGx5IG1hbmFnZWQKaW5zaWRlIHRoZSBndWVz
dCAoc28gbm90IHJlYWxseSB2aXNpYmxlIHRvIHRoZSBob3N0KSBidXQgYSBWVEwKaW1wbGVtZW50
YXRpb24gd2lsbC4gIFNvIEkgdGhpbmsgdGhlIGJpZyBxdWVzdGlvbiBiZWNvbWVzIGhvdyBhcmUg
d2UKZ29pbmcgdG8gYWNoaWV2ZSBhZGRyZXNzIHNwYWNlIHNlcGFyYXRpb24gZm9yIHBsYW5lcz8g
IEl0J3MgdGVtcHRpbmcgdG8Kc2F5IHNpbXBseSBvbmUgYWRkcmVzcyBzcGFjZSBwZXIgcGxhbmUg
YW5kIG1ha2UgU01NIGl0cyBvd24gcGxhbmUgd2l0aApkaWZmZXJlbnQgc3dpdGNoaW5nIGJ1dCBp
dCdzIGFuIGF3ZnVsIGxvdCBvZiBvdmVyaGVhZCBlc3BlY2lhbGx5IGFzCm1vc3QgVk1zIHdvbid0
IGV2ZW4gdXNlIHBsYW5lcywgc28gaXQgbG9va3MgbGlrZSB0aGVyZSBoYXMgdG8gYmUgYSBtb3Jl
Cm9wcG9ydHVuaXN0aWMgbW9kZWwgZm9yIHBsYW5lcyBhZGRyZXNzIHNwYWNlcy4KCj4gTW9yZSBp
bXBvcnRhbnRseSwgSSB0aGluayB0aGUgYXJlYSBvZiBWaXJ0dWFsaXphdGlvbiBCYXNlZCBTZWN1
cml0eQo+IHdvdWxkIGJlbmVmaXQgZnJvbSBhIHZlcnNhdGlsZSBQbGFuZXMgaW1wbGVtZW50YXRp
b24uIEZvcmNpbmcKPiBzcGVjaWZpYyBwbGFuZSBzd2l0Y2hpbmcgc2VtYW50aWNzIG1pZ2h0IHBy
ZXZlbnQgdGhlIGludHJvZHVjdGlvbiBWU00KPiBhbHRlcm5hdGl2ZXMgb3IgZXh0ZW5zaW9ucy4g
SGVraSBhbmQgbFZCUyBjb21lIHRvIG1pbmQgaGVyZS4KPiAKPiA+IEkgcmVhZCBhIGJpdCBtb3Jl
IGFib3V0IFZTTSBhbmQgaXQgc2VlbXMgdGhlaXIgcHJpb3JpdGl6YXRpb24gb2YKPiA+IFZUTHMg
aXMgYSBiaXQgbW9yZSBjb21wbGljYXRlZC4gVlRMMCBoYXMgdGhlIGxlYXN0IHByaXZpbGVnZXMg
YnV0Cj4gPiBib290cyBmaXJzdCwgdGhlbiBzZXRzIHVwIFZUTDEuIEJ1dCBWVEwxIGlzIG9ubHkg
aGlnaGVyLXByaXZpbGVnZWQKPiA+IG9uY2UgaXQgaXMgbG9ja2VkIGJ5IFZUTDAuIEFub3RoZXIg
d2F5IHRvIGxvb2sgYXQgaXQgaXMgdGhhdCBWVEwwCj4gPiBkZS1wcmlvcml0aXplcyBpdHNlbGYu
Cj4gPiAKPiA+IFRoZSBwYXRjaGVzIGhlcmUgYXJlIGJ1aWx0IGFyb3VuZCB0aGUgYXNzdW1wdGlv
biB0aGF0IHBsYW5lMCBpcyB0aGUKPiA+IGhpZ2hlc3QgcHJpdmlsZWdlZCBvbmUgYW5kIGlzIGFs
d2F5cyBydW5uYWJsZS4gUnVubmluZyBhbnkgbG93ZXItCj4gPiBwcml2aWxlZ2UgcGxhbmUgbXVz
dCBiZSB0cmlnZ2VyZWQgYnkgdGhlIGd1ZXN0LiBUaGlzIGlzIGNsZWFybHkgbm90Cj4gPiBzdWZm
aWNpZW50IGZvciBWU00sIHRoZSBxdWVzdGlvbiBpcyBob3cgdG8gc29sdmUgdGhhdC4KPiAKPiBJ
J2Qgc3VnZ2VzdCBpbnZlcnRpbmcgdGhlIHByaW9yaXRpZXMsIHdpdGggaGlnaGVyIHBsYW5lcyBi
ZWluZyBtb3JlCj4gcHJpdmlsZWdlZC4gSXQnbGwgbWFrZSBpbnRyb2R1Y2luZyBoaWdoZXIgcHJp
dmlsZWdlIGxldmVscyBlYXNpZXIuCj4gVGhpcyBpcyBlc3BlY2lhbGx5IHVzZWZ1bCB3aXRoIFZT
TSwgd2hlcmUgaXQncyBub3QgcG9zc2libGUgdG8ga25vdwo+IGhvdyBtYW55IGxldmVscyB3aWxs
IGJlIGVuYWJsZWQgYmVmb3JlIGxhdW5jaGluZyB0aGUgVk0uCgpJIGFscmVhZHkgYWRkcmVzc2Vk
IHRoaXMgaW4gYSBkaWZmZXJlbnQgcmVwbHkKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS81
NzBmODJlOGI4YmM5NjhhMzFhNGJhODU5MTQ1ZjZjMzI0ZTQxMjQ3LmNhbWVsQEhhbnNlblBhcnRu
ZXJzaGlwLmNvbS8KCmJ1dCBiYXNpY2FsbHkgSSB0aGluayBoaWVyYXJjaGljYWwgcHJpdmlsZWdl
IHdpbGwgYmUgdG9vIGxpbWl0aW5nLiAgSQphZ3JlZSB3ZSBuZWVkIHRvIGhhdmUgZW5vdWdoIHBy
aW1pdGl2ZXMgdG8gYnJpbmcgdXAgaGllcmFyY2hpY2FsIFZTTXMKaWYgdGhhdCdzIHdoYXQgdGhl
IGd1ZXN0IHdhbnRzIChXaW5kb3dzIGRlZmluaXRlbHkgd2lsbCkgYnV0IHRoaXMKc2hvdWxkbid0
IGJlIHRoZSBvbmx5IHRoaW5nIHdlIGNhbiBhcnJhbmdlIHBsYW5lcyBhcy4gIFRoZSBtdXR1YWxs
eQpkaXN0cnVzdGluZyBtb2RlbCBoYXMgYSBsb3QgZ29pbmcgZm9yIGl0IGluIHRlcm1zIG9mIHNl
Y3VyaXR5CnByb3BlcnRpZXMuCgpSZWdhcmRzLAoKSmFtZXMKCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
