From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 9 Nov 2023 09:25:43 +0100
Subject: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
In-Reply-To: <20231108233723.3380042-1-amoorthy@google.com>
References: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
 <20231108233723.3380042-1-amoorthy@google.com>
Message-ID: <143f5411-9fc0-4e88-9e35-6f3679b6f930@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/9/23 00:37, Anish Moorthy wrote:
> On Wed, Nov 8, 2023 at 9:00?AM Anish Moorthy <amoorthy@google.com> wrote:
>>
>> This commit breaks the arm64 selftests build btw: looks like a simple oversight?
> 
> Yup, fix is a one-liner. Posted below.
> 
> diff --git a/tools/testing/selftests/kvm/aarch64/page_fault_test.c b/tools/testing/selftests/kvm/aarch64/page_fault_test.c
> index eb4217b7c768..08a5ca5bed56 100644
> --- a/tools/testing/selftests/kvm/aarch64/page_fault_test.c
> +++ b/tools/testing/selftests/kvm/aarch64/page_fault_test.c
> @@ -705,7 +705,7 @@ static void run_test(enum vm_guest_mode mode, void *arg)
>   
>   	print_test_banner(mode, p);
>   
> -	vm = ____vm_create(mode);
> +	vm = ____vm_create(VM_SHAPE(mode));

Yes, this is similar to the s390 patch I sent yesterday 
(https://patchew.org/linux/20231108094055.221234-1-pbonzini at redhat.com/).

Paolo


