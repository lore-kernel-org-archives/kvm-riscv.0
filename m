Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EA4C83F27
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NptqmDsMnK1d3Z9SIrq2AmrPnJUhJEqE3tpXIPZdizc=; b=YGktvWaeyHu0KO
	kA8OkkUcBLQF2wwmx720vstmBhL+yo668JUPlj1OBk8OHKSIpH4harQKBsbAPb3WrSbmkqP82MxVS
	s1JU9VMqienThW01hOuMsRotlPde8bBpUcIA0SjdOyPYDNA3zrmL0Cz5MLB18pT3UqxBMWoZZc7yq
	5DmcpkrYsSqcK+ylbNVVmlVMKkjv1CnUH8HoRzevOXpDBHjE8iSIsR1kKhBRS+Bdz1RdYdzAho+mk
	8Noa2wuqfxxVVUL59heC6695wvW/JrnM85H+eW1O2YFh/5eHcFlH1Ms/qpxDg5uivpkmC/TxXHyG3
	H/SL3G1t3PdC66hqs1yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDUe-00000002cEm-1W5I;
	Tue, 22 Jul 2025 13:57:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCsD-00000002WxT-0f88;
	Tue, 22 Jul 2025 13:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87BDA419DF;
	Tue, 22 Jul 2025 13:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EE0C4CEEB;
	Tue, 22 Jul 2025 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753190255;
	bh=3leS8riuCJe+lnyQnQIcRHprkIXpvrMzyIhcjLqEY1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJNhgn6qehAH7M6iwdt46ZSRtnpNN7QCYzYCFtpxyCOf9hD4MrstgMo6XRuzOF91c
	 sjv8RgAd4UifKt4aPajQt1uLJIdA0CTSwNfFbDlcF8QJmy0M1E/dH6Wnj4IbwqUdGe
	 ykJV6IdS8vz+9K5Gck9anM2yCECJ0V9cL76ZDvhaL3VsgFphEVvk35vu854JJEIwlA
	 mZWzP7DiEysaVcb+3NYpPiKRGR79NaQI9mdGR3PpkUTqTS0UDACcR/srpvBKQCaSpU
	 pNXOiIOJ9CTniD++dcKH1fM5/oz7ADMNXTsOBMNvN1K4Jc/tbgBPJI1VGCJ8Pig1kl
	 UZQ70MIhMgvQg==
Date: Tue, 22 Jul 2025 14:17:30 +0100
From: Will Deacon <will@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 0/9] Add SBI v3.0 PMU enhancements
Message-ID: <aH-PanNcaHsbSlOd@willie-the-truck>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
 <CAAhSdy2XM+3UQD0FZehJnmCbjwRMCZQpt1cEkb4gmJu+LFsaKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2XM+3UQD0FZehJnmCbjwRMCZQpt1cEkb4gmJu+LFsaKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_061737_237056_10F23E1B 
X-CRM114-Status: GOOD (  24.00  )
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgMDk6Mjk6NDBBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUdWUsIEp1bCAyMiwgMjAyNSBhdCA4OjQ14oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNo
cEByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IFNCSSB2My4wIHNwZWNpZmljYXRpb25bMV0g
YWRkZWQgdHdvIG5ldyBpbXByb3ZlbWVudHMgdG8gdGhlIFBNVSBjaGFwZXIuCj4gPiBUaGUgU0JJ
IHYzLjAgc3BlY2lmaWNhdGlvbiBpcyBmcm96ZW4gYW5kIHVuZGVyIHB1YmxpYyByZXZpZXcgcGhh
c2UgYXMKPiA+IHBlciB0aGUgUklTQy1WIEludGVybmF0aW9uYWwgZ3VpZGVsaW5lcy4KPiA+Cj4g
PiAxLiBBZGRlZCBhbiBhZGRpdGlvbmFsIGdldF9ldmVudF9pbmZvIGZ1bmN0aW9uIHRvIHF1ZXJ5
IGV2ZW50IGF2YWlsYWJsaXR5Cj4gPiBpbiBidWxrIGluc3RlYWQgb2YgaW5kaXZpZHVhbCBTQkkg
Y2FsbHMgZm9yIGVhY2ggZXZlbnQuIFRoaXMgaGVscHMgaW4KPiA+IGltcHJvdmluZyB0aGUgYm9v
dCB0aW1lLgo+ID4KPiA+IDIuIFJhdyBldmVudCB3aWR0aCBhbGxvd2VkIGJ5IHRoZSBwbGF0Zm9y
bSBpcyB3aWRlbmVkIHRvIGhhdmUgNTYgYml0cwo+ID4gd2l0aCBSQVcgZXZlbnQgdjIgYXMgcGVy
IG5ldyBjbGFyaWZpY2F0aW9uIGluIHRoZSBwcml2IElTQVsyXS4KPiA+Cj4gPiBBcGFydCBmcm9t
IGltcGxlbWVudGluZyB0aGVzZSBuZXcgZmVhdHVyZXMsIHRoaXMgc2VyaWVzIGltcHJvdmVzIHRo
ZSBncGEKPiA+IHJhbmdlIGNoZWNrIGluIEtWTSBhbmQgdXBkYXRlcyB0aGUga3ZtIFNCSSBpbXBs
ZW1lbnRhdGlvbiB0byBTQkkgdjMuMC4KPiA+Cj4gPiBUaGUgb3BlbnNiaSBwYXRjaGVzIGhhdmUg
YmVlbiBtZXJnZWQuIFRoaXMgc2VyaWVzIGNhbiBiZSBmb3VuZCBhdCBbM10uCj4gPgo+ID4gWzFd
IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvcmVsZWFzZXMv
ZG93bmxvYWQvdjMuMC1yYzcvcmlzY3Ytc2JpLnBkZgo+ID4gWzJdIGh0dHBzOi8vZ2l0aHViLmNv
bS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL2lzc3Vlcy8xNTc4Cj4gPiBbM10gaHR0cHM6Ly9naXRo
dWIuY29tL2F0aXNocDA0L2xpbnV4L3RyZWUvYjQvcG11X2V2ZW50X2luZm9fdjQKPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+
ID4gQ2hhbmdlcyBpbiB2NDoKPiA+IC0gUmViYXNlZCBvbiB0b3Agb2YgdjYuMTYtcmM3Cj4gPiAt
IEZpeGVkIGEgcG90ZW50aWFsIGNvbXBpbGF0aW9uIGlzc3VlIGluIFBBVENINS4KPiA+IC0gTWlu
b3IgdHlwb3MgZml4ZWQgUEFUQ0gyIGFuZCBQQVRDSDMuCj4gPiAtIEZpeGVkIHZhcmlhYmxlIG9y
ZGVyaW5nIGluIFBBVENINgo+ID4gLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjUwNTIyLXBtdV9ldmVudF9pbmZvLXYzLTAtZjdiYmE3ZmQ5Y2ZlQHJpdm9zaW5jLmNv
bQo+ID4KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAtIFJlYmFzZWQgb24gdG9wIG9mIHY2LjE1LXJj
Nwo+ID4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMTE1LXBt
dV9ldmVudF9pbmZvLXYyLTAtODQ4MTViNzAzODNiQHJpdm9zaW5jLmNvbQo+ID4KPiA+IENoYW5n
ZXMgaW4gdjI6Cj4gPiAtIERyb3BwZWQgUEFUQ0ggMiB0byBiZSB0YWtlbiBkdXJpbmcgcmNYLgo+
ID4gLSBJbXByb3ZlZCBncGEgcmFuZ2UgY2hlY2sgdmFsaWRhdGlvbiBieSBpbnRyb2R1Y2luZyBh
IGhlbHBlciBmdW5jdGlvbgo+ID4gICBhbmQgY2hlY2tpbmcgdGhlIGVudGlyZSByYW5nZS4KPiA+
IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTExOS1wbXVfZXZl
bnRfaW5mby12MS0wLWE0Zjk2OTE0MjFmOEByaXZvc2luYy5jb20KPiA+Cj4gPiAtLS0KPiA+IEF0
aXNoIFBhdHJhICg5KToKPiA+ICAgICAgIGRyaXZlcnMvcGVyZjogcmlzY3Y6IEFkZCBTQkkgdjMu
MCBmbGFnCj4gPiAgICAgICBkcml2ZXJzL3BlcmY6IHJpc2N2OiBBZGQgcmF3IGV2ZW50IHYyIHN1
cHBvcnQKPiA+ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQgc3VwcG9ydCBmb3IgUmF3IGV2ZW50IHYy
Cj4gPiAgICAgICBkcml2ZXJzL3BlcmY6IHJpc2N2OiBJbXBsZW1lbnQgUE1VIGV2ZW50IGluZm8g
ZnVuY3Rpb24KPiA+ICAgICAgIGRyaXZlcnMvcGVyZjogcmlzY3Y6IEV4cG9ydCBQTVUgZXZlbnQg
aW5mbyBmdW5jdGlvbgo+ID4gICAgICAgS1ZNOiBBZGQgYSBoZWxwZXIgZnVuY3Rpb24gdG8gdmFs
aWRhdGUgdmNwdSBncGEgcmFuZ2UKPiA+ICAgICAgIFJJU0MtVjogS1ZNOiBVc2UgdGhlIG5ldyBn
cGEgcmFuZ2UgdmFsaWRhdGUgaGVscGVyIGZ1bmN0aW9uCj4gPiAgICAgICBSSVNDLVY6IEtWTTog
SW1wbGVtZW50IGdldCBldmVudCBpbmZvIGZ1bmN0aW9uCj4gPiAgICAgICBSSVNDLVY6IEtWTTog
VXBncmFkZSB0aGUgc3VwcG9ydGVkIFNCSSB2ZXJzaW9uIHRvIDMuMAo+ID4KPiA+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3BtdS5oIHwgICAzICsKPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgICAyICstCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9zYmkuaCAgICAgICAgICB8ICAxMyArKysKPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Bt
dS5jICAgICAgICAgICAgIHwgIDc1ICsrKysrKysrKysrKy0KPiA+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaV9wbXUuYyAgICAgICAgIHwgICAzICsKPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aV9zdGEuYyAgICAgICAgIHwgICA2ICstCj4gPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
YyAgICAgICAgICB8IDE5MSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gPiAg
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oICAgICAgICAgICAgICB8ICAgMiArCj4gPiAgaW5jbHVk
ZS9saW51eC9wZXJmL3Jpc2N2X3BtdS5oICAgICAgICB8ICAgMSArCj4gPiAgdmlydC9rdm0va3Zt
X21haW4uYyAgICAgICAgICAgICAgICAgICB8ICAyMSArKysrCj4gPiAgMTAgZmlsZXMgY2hhbmdl
ZCwgMjU4IGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQo+IAo+IEFyZSB5b3Ugb2theSB3
aXRoIHRoaXMgc2VyaWVzIGdvaW5nIHRocm91Z2ggdGhlIEtWTSBSSVNDLVYgdHJlZSA/CgpUaGUg
UmlzYy1WIFBNVSBzdHVmZiB1c3VhbGx5IGdvZXMgdmlhIFBhbG1lciwgc28gd2hhdGV2ZXIgaGUg
cmVja29ucy4KCldpbGwKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
