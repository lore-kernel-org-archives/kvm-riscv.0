Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C64BC0218F
	for <kvm-riscv@archiver.kernel.org>; Sun,  2 Feb 2025 21:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtLRoS29CNJ+iwAclRXkZtMsbyuYplhkJpq8SsUZWh4=; b=hIkss2RhoD7cDO
	CC8q+fNumQ54k/QxQFSiq5JL1DlRICK8j08U00rDpQs7I3Z1evAWAMkT8OJJKH1g/46tpzc0sIxSD
	ztpKpq0+wkpV3yWkB7XJPEYUWYlrVo8LcWDOgO/dRwMVMdql35pwDpFFo7m/5pDsTJr1p2bkVeDAi
	1WeUBia2EWtiB0/SJ60OnohreceuPmPuz/mPLGBR9zNxYDxbZul1kKR7RQk5MkJlrzVirwtK5WSRo
	htA449YepB6LSGSdsNsAJc8wkpADRem5+YBX4d42P3m7lGz+uRC8xcs6XUjM/YD7y6zIjvGjBNpcu
	yIc5WKU7tR62SLii7NGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tehbg-0000000ECZL-26aV;
	Sun, 02 Feb 2025 21:34:20 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tehbd-0000000ECXw-0dpA;
	Sun, 02 Feb 2025 21:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1738532026; x=1739136826; i=j.neuschaefer@gmx.net;
	bh=G2eHfhQuejodnDOibyT663weFQ71Yl8E8QZl/5oxVv0=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lNI4wnLn373mkDHyreS/4go2WqLLFqysiF0LW3XiW1x/TglUrcPjkWZnauK8Ui1R
	 XU0ggv4mZdMXv3WIM/qA8OqL7HzNFmRqsXPGeFv9qLqrDmBT9CieOrZXNo3TRsVwk
	 5M5fmis0I0ZqKFicCRUGYCSGRY00DySlih9CvpHUYhrtW0TI+4+LHWAK3xKKq9uiR
	 AF9sgaalNQduw0ptfF6P0GLSwGBTtZ2Sbnp0wUl9NT0xaO+o63RoPV2h2xRaj9KRH
	 T47MTCEDaWQ9lzGI6z2ONFo/9+tBc9+MSvoR7Cu76PREt+9/X+8/eolBYqU9OY5tI
	 ME/oP5Cwa5qXcTCPKA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.210.218]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfYw-1tlHAA11D6-007KTC; Sun, 02
 Feb 2025 22:33:46 +0100
Date: Sun, 2 Feb 2025 22:33:36 +0100
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "A. Wilcox" <AWilcox@wilcox-tech.com>
Cc: Arnd Bergmann <arnd@kernel.org>, kvm@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/5] powerpc: kvm: drop 32-bit book3s
Message-ID: <Z5_ksID8Gv_Tg5F7@probook>
References: <20241221214223.3046298-1-arnd@kernel.org>
 <20241221214223.3046298-5-arnd@kernel.org>
 <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com>
X-Provags-ID: V03:K1:9/xKYk+mj967yFEydW37x3unDxvlzZDdriScJwSUFGFBVPwz408
 R4O7IVTtnXePPO+gVIX8jktVCSK3SLk5KSpqblHo9ocA7Uo1TTIFaSqN1IJ0B/nSnHdz+v4
 BQJUDyiTjBjastoDpF/hhIklw774C2Nk4pN/wxnwAA2nZ2/XzPYAWN671OjQUfPE/hjZF1w
 siMMlhFzAtG6iMd99XMIg==
UI-OutboundReport: notjunk:1;M01:P0:lvJI8XggPhM=;4W9A0Oo2CZWjUIca1pWrNgsKvKX
 z8V5mRgOrYvpaHbx85mspd7QV2ItcjEq+fbuEkib8xY69HipoOK+VJcOAfiLKjAnQJa/cEWvo
 CyiUn1zvL9+XgfNLjZDQvyYLO0OegTg5uO6ds6wuAoImA3OZR02zmCDlQoBOZ9Os/C7ncaKHX
 70bHqXPyIx5rnA5PX8W9/Gx/G2VS6JmbZloyyR+qYGwoXMa82ikMXsHgpXshd/zLqq4sSRHoV
 brXeZgfYB3/4Q/i8lba34oeUVPvRB47g7yr3WhGmhykJVM3QHf5w+IWCNM4T4JwjPSqcbUnBy
 pW5753Wdt1o3+XSulwpYV+SF3ehRAAk8zx7oc1eskQUwPEFPv3oL1tNRzd7KDJ7QGTMXKcMRR
 yJQnkoyomns15uYcWXEWc4eJ0Q3nqODjrT7/oPRM6PfF1axZPTcN9Ivt/coi8oAHzidpeZRw0
 1Nj7DtAAuIiIqTiXFnM71/83afL3vQKgrXVDhbGQ1eHgcUKHDNURj8Ov+oopEjNcqjdlWGWoN
 y/06JKYTlBaAC0sx1Fr8k1oOerFxYn2v0A6Nocs597aQ1BLqzSDJUkMmq+p9P2Xm8dVSsGGu4
 +4an3otnMm7ZdorWY7g0UeLINMt1RvZyhf3fM1MuxetqEnqnIxXuoEaAUo/5g5Axxnc7d+90+
 CqQvSZiR32dd7HV8x/oBhj3492A7USPGpPBHD4yhGucmE0EQGVrTjkK8T9VYH8nj9cnnIYytQ
 c78FwW3q6Jv7eRX43bsv6QZUi4Y1zzlJYyE8P/w9Z+DTvFNbOjo4v0JtfT9UWCC2FhaBW9Oqe
 anaWkC6cv6od7SLhWicorQPsOM2UcDiSTAWA1JBBk92fj+U5TadCXASiSa9qQiymc4ZHM3yzO
 lM7OUKempveM0+57H8oZtb5No0NKCLwN9BQw0eLJ5IAWaDGAEIDJxt+ql7gxKacp5U/eU07Qj
 +x4rzmw88GtPCbybRi41JUDTYLunI5I5clPvmpGMh+Q+iArBl4xRCVHV5M51h1gBJZkv85dmD
 aH2sWMqQaEJ7FBWhGUSRu1GLj09VqIO7JAoY2C9TpRmf/ao9g02EJaYOiaCtGJWsPsri7Jq9g
 rHR6DYNhdqLKm2SF8kAE86rpcJ8B0HKl2UyhO/OCxLvlUOemuYGVqW3BDk5RgNpYgKaXWeuiW
 ThzTcYCT9+ztyzdFsFjgwtA56kVcQc7C+VVodKwz9RtObFvhrK1yC2CXdCA+KcPiSnCTKvqes
 2EQX8ZYBWmYwZFGRWQrJtQmcKMRszV78bn8FnLMJ/9/2KEifFR7S9q34teR7+FFb4iUM9FW6x
 3zyl/UGrzimjzwEO+HD7CetGSspTpweqegk7AqIu8he+lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_133417_583924_67326F78 
X-CRM114-Status: GOOD (  21.43  )
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

T24gU2F0LCBEZWMgMjEsIDIwMjQgYXQgMDg6MTM6MTJQTSAtMDYwMCwgQS4gV2lsY294IHdyb3Rl
Ogo+IE9uIERlYyAyMSwgMjAyNCwgYXQgMzo0MuKAr1BNLCBBcm5kIEJlcmdtYW5uIDxhcm5kQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4gPgo+ID4gU3VwcG9ydCBmb3IgS1ZNIG9uIDMyLWJpdCBCb29rIElJSS1zIGltcGxlbWVu
dGF0aW9ucyB3YXMgYWRkZWQgaW4gMjAxMAo+ID4gYW5kIHN1cHBvcnRzIFBvd2VyTWFjLCBDSFJQ
LCBhbmQgZW1iZWRkZWQgcGxhdGZvcm1zIHVzaW5nIHRoZSBGcmVlc2NhbGUgRzQKPiA+IChtcGM3
NHh4KSwgZTMwMCAobXBjODN4eCkgYW5kIGU2MDAgKG1wYzg2eHgpIENQVXMgZnJvbSAyMDAzIHRv
IDIwMDkuCj4gPgo+ID4gRWFybGllciA2MDMvNjA0Lzc1MCBtYWNoaW5lcyBtaWdodCB3b3JrIGJ1
dCB3b3VsZCBiZSBldmVuIG1vcmUgbGltaXRlZAo+ID4gYnkgdGhlaXIgYXZhaWxhYmxlIG1lbW9y
eS4KPiA+Cj4gPiBUaGUgb25seSBsaWtlbHkgdXNlcnMgb2YgS1ZNIG9uIGFueSBvZiB0aGVzZSB3
ZXJlIHRoZSBmaW5hbCBBcHBsZQo+ID4gUG93ZXJNYWMvUG93ZXJCb29rL2lCb29rIEc0IG1vZGVs
cyB3aXRoIDJHQiBvZiBSQU0gdGhhdCB3ZXJlIGF0IHRoZSBoaWdoCj4gPiBlbmQgMjAgeWVhcnMg
YWdvIGJ1dCBhcmUganVzdCBhcyBvYnNvbGV0ZSBhcyB0aGVpciB4ODYtMzIgY291bnRlcnBhcnRz
Lgo+ID4gVGhlIGNvZGUgaGFzIGJlZW4gb3JwaGFuZWQgc2luY2UgMjAyMy4KPiA+Cj4gPiBUaGVy
ZSBpcyBzdGlsbCBhIG5lZWQgdG8gc3VwcG9ydCAzMi1iaXQgZ3Vlc3RzIGluIG9yZGVyIHRvIGJl
dHRlcgo+ID4gZGVidWcgcHJvYmxlbXMgb24gcHBjMzIga2VybmVscy4gVGhpcyBzaG91bGQgd29y
ayBpbiB0aGVvcnkgb24gYm90aAo+ID4gNjQtYml0IGJvb2tlIGFuZCBvbiA2NC1iaXQgYm9vazNz
IGhvc3RzLCBidXQgaXQgd291bGQgYmUgZ29vZCB0bwo+ID4gY29uZmlybSB0aGF0IHRoaXMgaXMg
c3RpbGwgdGhlIGNhc2UgYmVmb3JlIHRoZSBrbm93biB3b3JraW5nIG9wdGlvbgo+ID4gZ2V0cyBy
ZW1vdmVkLgpbLi4uXQo+IFRoYXQgc2FpZCwgSSB3b3VsZCBsaWtlIHRvIGtlZXAgdGhlIHN1cHBv
cnQgYWxpdmUgZm9yIG1vcmUgdGhhbiBqdXN0Cj4gcHBjMzIga2VybmVsIHRlc3RpbmcuICBUaGVy
ZSBhcmUgcGxlbnR5IG9mIFBvd2VyIE1hY3Mgd2l0aCBlbm91Z2gKPiBtZW1vcnkgdG8gcnVuIHNv
bWUgZW52aXJvbm1lbnRzIHdpdGhpbiBLVk0uICBBZMOpbGll4oCZcyBuZXcgcmVsZWFzZQo+IGJv
b3RzIGEgZnVsbCBYRkNFIGRlc2t0b3AgaW4gdW5kZXIgMzAwIE1CIFJBTSwgc28gZXZlbiBhIDEg
R0IgbWFjaGluZQo+IGhhcyBlbm91Z2ggbWVtb3J5IHRvIHJ1biBBbWlnYU9TLCBNYWMgT1MgOSwg
b3IgYW5vdGhlciBYRkNFIGluIEtWTS4KCkZXSVcsIEkgc2Vjb25kIHRoaXMuIEkgZG8gaW50ZW5k
IHRvIGdldCBLVk0gdG8gcnVuIG9uIG15IGUzMDAtYmFzZWQKYm9hcmQgZm9yIHNvbWUgcmVsYXRp
dmVseSBsaWdodCBndWVzdHMgc3VjaCBhcyBNYWMgT1MgOS4gSSBzdXNwZWN0IEkKd29uJ3QgYmUg
YWJsZSB0byBjb250cmlidXRlIG11Y2ggdG8gdGhlIG1haW50ZW5hbmNlLCB0aG91Z2guCgpCZXN0
IHJlZ2FyZHMsCkouIE5ldXNjaMOkZmVyCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
