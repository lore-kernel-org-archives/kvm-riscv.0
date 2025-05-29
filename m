Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F099C5B543
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 01:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4ndh0ymHr41u9qwY34T7Q68vlSoU2//sAvnHRJBoqE=; b=e7O7fNXu5A3SyQ
	Gy9Ajb3HM0J1alr+DcsDFVtO5oQcpHvvf8tUBCrpZ7vZtULWLqiKgcuRFQtrK4Ls6H1XPjpKeHr/w
	tGpm+ZNKJvrYV0p6E+4wY+Jagrhfpul1eSSjU+2wXRiNVF76BMSenFgcd9ZH0b+BrYLdUPi25ZTkl
	kaImy4LaN2I2bYI9F8rQ7taSZwViHSw/FFkXIbIZMDBhwUphrWiPm3NhXatA/imHuZFqv81JKxMiL
	zIiYHMeSV6ekj+T5kQkc9iYWhMWZ9UpNY6eijQXLtUGM+ZjwKRvqxl+r0x3tYiwmheJAs2/ffG2hx
	ckW7Gpgq3zHTGl43+mHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRvx-0000000EczB-0KLl;
	Thu, 29 May 2025 01:19:49 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRtt-0000000EcRS-1hQ4
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 01:17:43 +0000
Message-ID: <de7bb6aa-543f-4bfa-a76c-722871a8f0f2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748481449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8uJJOQ8lxfvmIQ5Wkp1c8cgXJ9Z8D5V6tF2OpxE4+0s=;
	b=tdjxoYDyfihDSKK53F2QPE25Xi4RHvl/i+uko67IN20AfTqw/yYy+C4v8Peh5pcKsbMf9e
	DqICBUuPyrC0fJezQDQIQzdsOdd3ikrpy93YRfZUDQu1JhzCkuUcWP61I6hCtM26xHO7VW
	nK/7rphkN1n8T56/5QltKyT5Tz/7VSE=
Date: Wed, 28 May 2025 18:17:23 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
Content-Language: en-US
In-Reply-To: <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_181741_733844_2D3D929C 
X-CRM114-Status: GOOD (  36.60  )
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

CgpPbiA1LzI4LzI1IDEyOjIxIFBNLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA8UmVtb3ZpbmcgUGFs
bWVyJ3Mgcml2b3MgZW1haWwgYWRkcmVzcyB0byBhdm9pZCBib3VuY2luZz4KPiAKPiBPbiA1LzI4
LzI1IDg6MDkgQU0sIEFuZHJldyBKb25lcyB3cm90ZToKPj4gT24gV2VkLCBNYXkgMjgsIDIwMjUg
YXQgMDc6MTY6MTFBTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+PiBPbiA1LzI2LzI1IDQ6
MTMgQU0sIEFuZHJldyBKb25lcyB3cm90ZToKPj4+PiBPbiBNb24sIE1heSAyNiwgMjAyNSBhdCAx
MTowMDozMEFNICswMjAwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+Pj4+IDIwMjUtMDUtMjNU
MTA6MTY6MTEtMDc6MDAsIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBsaW51eC5kZXY+Ogo+Pj4+
Pj4gT24gNS8yMy8yNSA2OjMxIEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+Pj4+Pj4gMjAy
NS0wNS0yMlQxMjowMzo0My0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+
Ogo+Pj4+Pj4+PiBVcGdyYWRlIHRoZSBTQkkgdmVyc2lvbiB0byB2My4wIHNvIHRoYXQgY29ycmVz
cG9uZGluZyBmZWF0dXJlcwo+Pj4+Pj4+PiBjYW4gYmUgZW5hYmxlZCBpbiB0aGUgZ3Vlc3QuCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3Np
bmMuY29tPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2LyAKPj4+Pj4+Pj4gaW5jbHVkZS9h
c20va3ZtX3ZjcHVfc2JpLmgKPj4+Pj4+Pj4gLSNkZWZpbmUgS1ZNX1NCSV9WRVJTSU9OX01BSk9S
IDIKPj4+Pj4+Pj4gKyNkZWZpbmUgS1ZNX1NCSV9WRVJTSU9OX01BSk9SIDMKPj4+Pj4+PiBJIHRo
aW5rIGl0J3MgdGltZSB0byBhZGQgdmVyc2lvbmluZyB0byBLVk0gU0JJIGltcGxlbWVudGF0aW9u
Lgo+Pj4+Pj4+IFVzZXJzcGFjZSBzaG91bGQgYmUgYWJsZSB0byBzZWxlY3QgdGhlIGRlc2lyZWQg
U0JJIHZlcnNpb24gYW5kIAo+Pj4+Pj4+IEtWTSB3b3VsZAo+Pj4+Pj4+IHRlbGwgdGhlIGd1ZXN0
IHRoYXQgbmV3ZXIgZmVhdHVyZXMgYXJlIG5vdCBzdXBwb3J0ZWQuCj4+Pj4gV2UgbmVlZCBuZXcg
Y29kZSBmb3IgdGhpcywgYnV0IGl0J3MgYSBnb29kIGlkZWEuCj4+Pj4KPj4+Pj4+IFdlIGNhbiBh
Y2hpZXZlIHRoYXQgdGhyb3VnaCBvbmVyZWcgaW50ZXJmYWNlIGJ5IGRpc2FibGluZyAKPj4+Pj4+
IGluZGl2aWR1YWwgU0JJCj4+Pj4+PiBleHRlbnNpb25zLgo+Pj4+Pj4gV2UgY2FuIGV4dGVuZCB0
aGUgZXhpc3Rpbmcgb25lcmVnIGludGVyZmFjZSB0byBkaXNhYmxlIGEgc3BlY2lmaWMgU0JJCj4+
Pj4+PiB2ZXJzaW9uIGRpcmVjdGx5Cj4+Pj4+PiBpbnN0ZWFkIG9mIGluZGl2aWR1YWwgb25lcyB0
byBzYXZlIHRob3NlIElPQ1RMIGFzIHdlbGwuCj4+Pj4+IFllcywgSSBhbSBhbGwgaW4gZmF2b3Ig
b2YgbGV0dGluZyB1c2Vyc3BhY2UgcHJvdmlkZSBhbGwgdmFsdWVzIGluIHRoZQo+Pj4+PiBCQVNF
IGV4dGVuc2lvbi4KPj4+IFdlIGFscmVhZHkgc3VwcG9ydCB2ZW5kb3JpZC9hcmNoaWQvaW1waWQg
dGhyb3VnaCBvbmUgcmVnLiBJIHRoaW5rIHdlIAo+Pj4ganVzdAo+Pj4gbmVlZCB0byBhZGQgdGhl
IFNCSSB2ZXJzaW9uIHN1cHBvcnQgdG8gdGhhdCBzbyB0aGF0IHVzZXIgc3BhY2UgY2FuIAo+Pj4g
c2V0IGl0Lgo+Pj4KPj4+PiBUaGlzIGlzIGNvdmVyZWQgYnkgeW91ciByZWNlbnQgcGF0Y2ggdGhh
dCBwcm92aWRlcyB1c2Vyc3BhY2Vfc2JpLgo+Pj4gV2h5IGRvIHdlIG5lZWQgdG8gaW52ZW50IG5l
dyBJT0NUTCBmb3IgdGhpcyA/IE9uY2UgdGhlIHVzZXIgc3BhY2UgCj4+PiBzZXRzIHRoZQo+Pj4g
U0JJIHZlcnNpb24sIEtWTSBjYW4gZW5mb3JjZSBpdC4KPj4gSWYgYW4gU0JJIHNwZWMgdmVyc2lv
biBwcm92aWRlcyBhbiBleHRlbnNpb24gdGhhdCBjYW4gYmUgZW11bGF0ZWQgYnkKPj4gdXNlcnNw
YWNlLCB0aGVuIHVzZXJzcGFjZSBjb3VsZCBjaG9vc2UgdG8gYWR2ZXJ0aXNlIHRoYXQgc3BlYyB2
ZXJzaW9uLAo+PiBpbXBsZW1lbnQgYSBCQVNFIHByb2JlIGZ1bmN0aW9uIHRoYXQgYWR2ZXJ0aXNl
cyB0aGUgZXh0ZW5zaW9uLCBhbmQKPj4gaW1wbGVtZW50IHRoZSBleHRlbnNpb24sIGV2ZW4gaWYg
dGhlIEtWTSB2ZXJzaW9uIHJ1bm5pbmcgaXMgb2xkZXIKPj4gYW5kIHVuYXdhcmUgb2YgaXQuIEJ1
dCwgaW4gb3JkZXIgdG8gZG8gdGhhdCwgd2UgbmVlZCBLVk0gdG8gZXhpdCB0bwo+PiB1c2Vyc3Bh
Y2UgZm9yIGFsbCB1bmtub3duIFNCSSBjYWxscyBhbmQgdG8gYWxsb3cgQkFTRSB0byBiZSBvdmVy
cmlkZGVuCj4gWW91IG1lYW4gb25seSB0aGUgdmVyc2lvbiBmaWVsZCBpbiBCQVNFIC0gQ29ycmVj
dCA/Cj4gCj4gV2UgYWxyZWFkeSBzdXBwb3J0IHZlbmRvcmlkL2FyY2hpZC9pbXBpZCB0aHJvdWdo
IG9uZSByZWcuIEkgZG9uJ3Qgc2VlIHRoZQo+IHBvaW50IG9mIG92ZXJyaWRpbmcgU0JJIGltcGxl
bWVudGF0aW9uIElEICYgdmVyc2lvbi4KPiAKPj4gYnkgdXNlcnNwYWNlLiBUaGUgbmV3IEtWTSBD
QVAgaW9jdGwgYWxsb3dzIG9wdGluZyBpbnRvIHRoYXQgbmV3IGJlaGF2aW9yLgo+IAo+IEJ1dCB3
aHkgd2UgbmVlZCBhIG5ldyBJT0NUTCBmb3IgdGhhdCA/IFdlIGNhbiBhY2hpZXZlIHRoYXQgd2l0
aCBleGlzdGluZwo+IG9uZSByZWcgaW50ZXJmYWNlIHdpdGggaW1wcm92ZW1lbnRzLgo+IAo+PiBU
aGUgb2xkIEtWTSB3aXRoIG5ldyBWTU0gY29uZmlndXJhdGlvbiBpc24ndCB0b3RhbGx5IGZhci1m
ZXRjaGVkLiBXaGlsZQo+PiBob3N0IGtlcm5lbHMgdGVuZCB0byBnZXQgdXBkYXRlZCByZWd1bGFy
bHkgdG8gaW5jbHVkZSBzZWN1cml0eSBmaXhlcywKPj4gZW50ZXJwcmlzZSBrZXJuZWxzIHRlbmQg
dG8gc3RvcCBhZGRpbmcgZmVhdHVyZXMgYXQgc29tZSBwb2ludCBpbiBvcmRlcgo+PiB0byBtYXhp
bWl6ZSBzdGFiaWxpdHkuIFdoaWxlIGVudGVycHJpc2UgVk1NcyB3b3VsZCBhbHNvIGV2ZW50dWFs
bHkgc3RvcAo+PiBhZGRpbmcgZmVhdHVyZXMsIGVudGVycHJpc2UgY29uc3VtZXJzIGFyZSBhbHdh
eXMgZnJlZSB0byB1c2UgdGhlaXIgb3duCj4+IFZNTXMgKGF0IHRoZWlyIG93biByaXNrKS4gU28s
IHRoZXJlJ3MgYSByZWFsIGNoYW5jZSB3ZSBjb3VsZCBoYXZlCj4gCj4gSSB0aGluayB3ZSBhcmUg
eWVhcnMgYXdheSBmcm9tIHRoYXQgaGFwcGVuaW5nIChpZiBpdCBoYXBwZW5zKS4gTXkgCj4gc3Vn
Z2VzdGlvbiB3YXMgbm90IHRvCj4gdHJ5IHRvIGJ1aWxkIGEgd29ybGQgd2hlcmUgbm8gYm9keSBs
aXZlcyA7KS4gV2hlbiB3ZSBnZXQgdG8gdGhhdCAKCldlIGFsc28gc3VwcG9ydCBLVk0gYXMgYSBr
ZXJuZWwgbW9kdWxlLiBTbyBpdCBpcyByZWxhdGl2ZWx5IGVhc2llciB0byAKdXBkYXRlIHRoZSBS
SVNDLVYgS1ZNIG1vZHVsZSBmb3IgZW50ZXJwcmlzZSBjb25zdW1lcnMuCgo+IHNjZW5hcmlvLCB0
aGUgZGVmYXVsdCBLVk0KPiBzaGlwcGVkIHdpbGwgaGF2ZSBtYW55IGV4dGVuc2lvbiBpbXBsZW1l
bnRlZC4gU28gdGhlcmUgd29uJ3QgYmUgbXVjaCAKPiBhZHZhbnRhZ2UgdG8KPiByZWltcGxlbWVu
dCB0aGVtIGluIHRoZSB1c2VyIHNwYWNlLiBXZSBjYW4gYWxzbyB0YWtlIGFuIGluZm9ybWVkIAo+
IGRlY2lzaW9uIGF0IHRoYXQgdGltZQo+IGlmIHRoZSBjdXJyZW50IHNlbGVjdGl2ZSBmb3J3YXJk
aW5nIGFwcHJvYWNoIGlzIGJldHRlciBvciB3ZSBuZWVkIHRvIAo+IGJsaW5kbHkgZm9yd2FyZCBh
bnkKPiB1bmtub3duIFNCSSBjYWxscyB0byB0aGUgdXNlciBzcGFjZS4KPiAKPj4gZGVwbG95bWVu
dHMgd2l0aCBvbGRlciwgc3RhYmxlIEtWTSB3aGVyZSB1c2VycyB3YW50IHRvIGVuYWJsZSBsYXRl
ciBTQkkKPj4gZXh0ZW5zaW9ucywgYW5kLCBpbiBzb21lIGNhc2VzLCB0aGF0IHNob3VsZCBiZSBw
b3NzaWJsZSBieSBqdXN0IHVwZGF0aW5nCj4+IHRoZSBWTU0gLS0gYnV0IG9ubHkgaWYgS1ZNIGlz
IG9ubHkgYWN0aW5nIGFzIGFuIFNCSSBpbXBsZW1lbnRhdGlvbgo+PiBhY2NlbGVyYXRvciBhbmQg
bm90IGFzIGEgdXNlcnNwYWNlIFNCSSBpbXBsZW1lbnRhdGlvbiBnYXRla2VlcGVyLgo+IAo+IEJ1
dCBzb21lIG9mIHRoZSBTQkkgZXh0ZW5zaW9ucyBhcmUgc28gZnVuZGFtZW50YWwgdGhhdCBpdCBt
dXN0IGJlIAo+IGltcGxlbWVudGVkIGluIEtWTQo+IGZvciB2YXJpb3VzIHJlYXNvbnMgcG9pbnRl
ZCBieSBBbnVwIG9uIG90aGVyIHRocmVhZC4KPiAKPj4gVGhhbmtzLAo+PiBkcmV3Cj4+Cj4+Pj4g
V2l0aCB0aGF0LCB1c2Vyc3BhY2UgY2FuIGRpc2FibGUgYWxsIGV4dGVuc2lvbnMgdGhhdCBhcmVu
J3QKPj4+PiBzdXBwb3J0ZWQgYnkgYSBnaXZlbiBzcGVjIHZlcnNpb24sIGRpc2FibGUgQkFTRSBh
bmQgdGhlbiBwcm92aWRlCj4+Pj4gYSBCQVNFIHRoYXQgYWR2ZXJ0aXNlcyB0aGUgdmVyc2lvbiBp
dCB3YW50cy4gVGhlIG5ldyBjb2RlIGlzIG5lZWRlZAo+Pj4+IGZvciBleHRlbnNpb25zIHRoYXQg
dXNlcnNwYWNlIHN0aWxsIHdhbnRzIEtWTSB0byBhY2NlbGVyYXRlLCBidXQgdGhlbgo+Pj4+IEtW
TSBuZWVkcyB0byBiZSBpbmZvcm1lZCBpdCBzaG91bGQgZGVueSBhbGwgZnVuY3Rpb25zIG5vdCBp
bmNsdWRlZCBpbgo+Pj4+IHRoZSBzZWxlY3RlZCBzcGVjIHZlcnNpb24uCj4+Pj4KPj4+PiBUaGFu
a3MsCj4+Pj4gZHJldwo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+PiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
